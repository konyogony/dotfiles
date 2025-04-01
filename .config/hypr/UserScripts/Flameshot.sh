# Kony made this
temp_file="/tmp/screenshot.png"

# Capture screenshot with Flameshot
XDG_CURRENT_DESKTOP=sway flameshot gui -r > "$temp_file"

# Check if the file is a PNG image, else remove it
if [[ $(file --mime-type -b "$temp_file") != "image/png" ]]; then
    rm "$temp_file"
else
    # Use Clipman to copy the screenshot to clipboard
    wl-copy < "$temp_file"
    rm "$temp_file"
fi
