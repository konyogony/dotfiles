#!/usr/bin/env zsh 
set -euo pipefail

echo "Verifying system dependencies..."
for cmd in curl unzip jq; do
    if ! command -v "$cmd" &>/dev/null; then
        echo "Error: '$cmd' is required but not installed." >&2
        exit 1
    fi
done

echo "Detecting AUR helper..."
if command -v paru &>/dev/null; then
    AUR_HELPER="paru"
elif command -v yay &>/dev/null; then
    AUR_HELPER="yay"
else
    echo "Error: Neither 'paru' nor 'yay' was found." >&2
    echo "Please install an AUR helper to continue." >&2
    exit 1
fi

echo
echo "Ensuring core system packages are installed/updated..."

SPICETIFY_PKG="spicetify-cli"
if pacman -Qs spicetify-bin &>/dev/null; then
    SPICETIFY_PKG="spicetify-bin"
fi

$AUR_HELPER -S --needed --noconfirm spotify-launcher "$SPICETIFY_PKG"

CONFIG_FILE=$(spicetify -c 2>/dev/null || true)

if [[ -n "$CONFIG_FILE" ]]; then
    SPICETIFY_DIR="$(dirname "$CONFIG_FILE")"
elif [[ -n "${XDG_CONFIG_HOME:-}" ]]; then
    SPICETIFY_DIR="$XDG_CONFIG_HOME/spicetify"
else
    SPICETIFY_DIR="$HOME/.config/spicetify"
fi

CUSTOM_APPS_DIR="$SPICETIFY_DIR/CustomApps"

if [[ ! -f "$SPICETIFY_DIR/config-xpui.ini" ]]; then
    echo "Initializing Spicetify configuration..."
    spicetify >/dev/null 2>&1 || true
fi

SPOTIFY_PATH="$HOME/.local/share/spotify-launcher/install/usr/share/spotify"
PREFS_PATH="$HOME/.config/spotify/prefs"

if [[ ! -d "$SPOTIFY_PATH" ]]; then
    echo "--------------------------------------------------------"
    echo "Warning: Spotify installation directory not found!"
    echo "Expected path: $SPOTIFY_PATH"
    echo
    echo "Because you are using 'spotify-launcher', you must run"
    echo "it once so it can fetch the Spotify client files."
    echo "--------------------------------------------------------"
    echo "Attempting to launch spotify-launcher..."
    spotify-launcher &
    echo "Please close Spotify once it finishes downloading, then run this script again."
    exit 0
fi

echo "Setting Spicetify paths..."
spicetify config spotify_path "$SPOTIFY_PATH"
spicetify config prefs_path "$PREFS_PATH"

echo
echo "Downloading and installing Spicetify Marketplace..."

mkdir -p "$CUSTOM_APPS_DIR"
TMP=$(mktemp -d)

curl -fsSL \
    "https://github.com/spicetify/marketplace/releases/latest/download/marketplace.zip" \
    -o "$TMP/marketplace.zip"

rm -rf "$CUSTOM_APPS_DIR/marketplace"

TMP_EXTRACT=$(mktemp -d)
unzip -q "$TMP/marketplace.zip" -d "$TMP_EXTRACT"

set +e
EXTRACTED_ITEMS=("$TMP_EXTRACT"/*)
set -e

if [[ -d "${EXTRACTED_ITEMS[0]:-}" && ${#EXTRACTED_ITEMS[@]} -eq 1 ]]; then
    mv "${EXTRACTED_ITEMS[0]}" "$CUSTOM_APPS_DIR/marketplace"
else
    mv "$TMP_EXTRACT" "$CUSTOM_APPS_DIR/marketplace"
fi

rm -rf "$TMP" "$TMP_EXTRACT"
echo "Marketplace installed to: $CUSTOM_APPS_DIR/marketplace"

MARKETPLACE_THEME_DIR="$SPICETIFY_DIR/Themes/marketplace"
if [[ ! -d "$MARKETPLACE_THEME_DIR" ]]; then
    echo "Creating Marketplace placeholder theme..."
    mkdir -p "$MARKETPLACE_THEME_DIR"
    curl -fsSL "https://raw.githubusercontent.com/spicetify/marketplace/main/resources/color.ini" -o "$MARKETPLACE_THEME_DIR/color.ini" || true
fi

spicetify config custom_apps marketplace
spicetify config inject_css 1 replace_colors 1

CURRENT_THEME=$(spicetify config current_theme 2>/dev/null || echo "")
if [[ -z "$CURRENT_THEME" || "$CURRENT_THEME" == " " ]]; then
    echo "No theme detected. Defaulting to 'marketplace' theme..."
    spicetify config current_theme marketplace
fi

echo
echo "Applying Spicetify..."
if spicetify apply; then
    echo "Done."
    exit 0
fi

echo
echo "Apply failed. Attempting clean recovery and backup apply..."
spicetify restore || true
if spicetify backup apply; then
    echo "Recovery successful."
else
    echo "Error: Spicetify application failed." >&2
    exit 1
fi
