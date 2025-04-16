#!/bin/bash
scriptsDir=$HOME/.config/hypr/scripts
wallpaper=$HOME/.config/hypr/wallpaper.jpg
kvantum_theme="Catppuccin-Mocha"
color_scheme="prefer-dark"
gtk_theme="Andromeda-dark"
icon_theme="Flat-Remix-Blue-Dark"
cursor_theme="Bibata-Modern-Ice"

mpvpaper_cmd="mpvpaper -o "no-audio --loop" '*' /home/kony/.config/hypr/wave.gif"
swww_cmd="swww img"
effect="--transition-bezier .43,1.19,1,.4 --transition-fps 30 --transition-type grow --transition-pos 0.925,0.977"

if [ ! -f ~/.config/hypr/.initial_startup_done ]; then
    swww query || swww-daemon && $swww_cmd $wallpaper $effect

    gsettings set org.gnome.desktop.interface color-scheme $color_scheme >/dev/null 2>&1 &
    gsettings set org.gnome.desktop.interface gtk-theme $gtk_theme >/dev/null 2>&1 &
    gsettings set org.gnome.desktop.interface icon-theme $icon_theme >/dev/null 2>&1 &
    gsettings set org.gnome.desktop.interface cursor-theme $cursor_theme >/dev/null 2>&1 &
    gsettings set org.gnome.desktop.interface cursor-size 24 >/dev/null 2>&1 &
    kvantummanager --set "$kvantum_theme" >/dev/null 2>&1 &

    # initiate the kb_layout (for some reason) waybar cant launch it, DO I NEED THIS??
    "$scriptsDir/SwitchKeyboardLayout.sh" >/dev/null 2>&1 &

    # Create a marker file to indicate that the script has been executed, SEEMS USELESS TO ME
    touch ~/.config/hypr/.initial_startup_done

    exit
fi

# https://wallhaven.cc/
# https://wallhaven.cc/w/r73pow 8/10
# https://wallhaven.cc/w/yxz25k 3/10
# https://wallhaven.cc/w/vq76dp 7/10
# https://wallhaven.cc/w/9dym6x 8/10
# https://wallhaven.cc/w/qdzmoq 6/10
# https://wallhaven.cc/w/5753l8 6/10
# https://wallhaven.cc/w/r2vrl7 6.5/10
# https://wallhaven.cc/w/nr9llj 6/10
# https://wallhaven.cc/w/6drvdq 8/10
# https://wallhaven.cc/w/g8r373 6/10
# https://wallhaven.cc/w/gjp1m7 7.5/10
# https://wallhaven.cc/w/2epdjm 4/10
# https://wallhaven.cc/w/83ow2y 6/10
