#!/bin/bash
scriptsDir=$HOME/.config/hypr/scripts
wallpaper=$HOME/.config/hypr/wallpaper_effects/.wallpaper_modified
waybar_style="$HOME/.config/waybar/style/[Colored] Chroma Glow.css"
kvantum_theme="Catppuccin-Mocha"
color_scheme="prefer-dark"
gtk_theme="Andromeda-dark"
icon_theme="Flat-Remix-Blue-Dark"
cursor_theme="Bibata-Modern-Ice"

mpvpaper_cmd="mpvpaper -o "no-audio --loop" '*' /home/kony/.config/hypr/wave.gif"
swww_cmd="swww img"
effect="--transition-bezier .43,1.19,1,.4 --transition-fps 30 --transition-type grow --transition-pos 0.925,0.977"

# Check if a marker file exists, not sure how or why this works
if [ ! -f ~/.config/hypr/.initial_startup_done ]; then
    # Initilize wallpaper using mpvpaper_cmd
    # $mpvpaper_cmd > /dev/null 2>&1 &

    swww query || swww-daemon && $swww_cmd $wallpaper $effect

    # initiate GTK dark mode and apply icon and cursor theme
    gsettings set org.gnome.desktop.interface color-scheme $color_scheme >/dev/null 2>&1 &
    gsettings set org.gnome.desktop.interface gtk-theme $gtk_theme >/dev/null 2>&1 &
    gsettings set org.gnome.desktop.interface icon-theme $icon_theme >/dev/null 2>&1 &
    gsettings set org.gnome.desktop.interface cursor-theme $cursor_theme >/dev/null 2>&1 &
    gsettings set org.gnome.desktop.interface cursor-size 24 >/dev/null 2>&1 &

    # initiate kvantum theme
    kvantummanager --set "$kvantum_theme" >/dev/null 2>&1 &

    # initiate the kb_layout (for some reason) waybar cant launch it, DO I NEED THIS??
    "$scriptsDir/SwitchKeyboardLayout.sh" >/dev/null 2>&1 &

    # Initial waybar style
    if [ -f "$waybar_style" ]; then
        ln -sf "$waybar_style" "$HOME/.config/waybar/style.css"
        "$scriptsDir/Refresh.sh" >/dev/null 2>&1 &
    fi

    # Create a marker file to indicate that the script has been executed, SEEMS USELESS TO ME
    touch ~/.config/hypr/.initial_startup_done

    exit
fi

# https://wallhaven.cc/
