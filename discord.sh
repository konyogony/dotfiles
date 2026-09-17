#!/usr/bin/env zsh 

yes | paru -Syy discord --needed

if paru -Q discord &>/dev/null; then
    echo "Discord installed successfully."
    vencord_url="https://github.com/Vendicated/VencordInstaller/releases/latest/download/VencordInstallerCli-Linux"
    vencord_path="$HOME/vencord_installer.sh"

    latest_modified=$(curl -sI "$vencord_url" | grep -i "last-modified" | cut -d' ' -f2-)

    if [ -f "$vencord_path" ]; then
        local_modified=$(stat -c "%y" "$vencord_path" | cut -d' ' -f1-2)
    else
        local_modified=""
    fi

    curl -z "$vencord_path" -L -o "$vencord_path" "$vencord_url"
    chmod +x "$vencord_path"

    sudo "$vencord_path" -install
    echo "Vencord repair/install completed."

    desktop_file="/usr/share/applications/discord.desktop"
    if [ -f "$desktop_file" ]; then
        echo "Patching .desktop file..."

        sudo cp "$desktop_file" "${desktop_file}.bak"

        if ! grep -q -- '--disable-gpu' "$desktop_file"; then
            sudo sed -i 's|^\(Exec=.*\)$|\1 --disable-gpu|' "$desktop_file"
            echo "--disable-gpu flag added to Exec line."
        else
            echo "--disable-gpu already present in Exec line."
        fi
    else
        echo "Desktop file not found at $desktop_file"
    fi
else
    echo "Discord installation failed. Please check your setup."
    exit 1
fi
