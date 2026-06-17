#!/usr/bin/env bash

# Kill existing to prevent hanging
pkill flameshot

# Standard Wayland variables
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland

# -r (raw) sends the image to stdout
# wl-copy -t image/png takes that stdout and puts it in your clipboard
flameshot gui -r | wl-copy -t image/png
