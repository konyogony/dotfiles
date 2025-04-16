#!/bin/bash
yes | yay -Syy discord-canary --needed

if yay -Q discord-canary &>/dev/null; then
    echo "Discord Canary installed successfully."
    vencord_url="https://github.com/Vendicated/VencordInstaller/releases/latest/download/VencordInstallerCli-Linux"
    vencord_path="$HOME/vencord_installer.sh"

    latest_modified=$(curl -sI "$vencord_url" | grep -i "last-modified" | cut -d' ' -f2-)
    local_modified=$(stat -c "%y" "$vencord_path" | cut -d' ' -f1-2)

    if [ "$local_modified" != "$latest_modified" ]; then
        curl -L -o "$vencord_path" "$vencord_url"
        chmod +x "$vencord_path"
    fi

    sudo "$vencord_path" -install -branch canary
    echo "Vencord repair completed."
else
    echo "Discord Canary installation failed. Please check your setup."
    exit 1
fi
