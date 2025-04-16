#!/bin/bash

# Set screenshot folder and file name
screenshot_dir="$HOME/Pictures/Screenshots"
mkdir -p "$screenshot_dir"

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
final_path="$screenshot_dir/flameshot_$timestamp.png"

# Take screenshot and save directly
XDG_CURRENT_DESKTOP=sway flameshot gui -p "$final_path"

# Validate and copy if it's a valid PNG
if [[ $(file --mime-type -b "$final_path") == "image/png" ]]; then
    wl-copy <"$final_path"
    echo "Screenshot saved to $final_path"
else
    rm "$final_path"
    echo "Invalid screenshot. File deleted."
fi
