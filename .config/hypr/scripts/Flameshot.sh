#!/bin/bash
temp_file="/tmp/screenshot.png"

XDG_CURRENT_DESKTOP=sway flameshot gui -r >"$temp_file"

if [[ $(file --mime-type -b "$temp_file") != "image/png" ]]; then
    rm "$temp_file"
else
    wl-copy <"$temp_file"
    rm "$temp_file"
fi
