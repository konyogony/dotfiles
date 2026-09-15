local homeDir = os.getenv("HOME")

hl.on("hyprland.start", function()
	os.execute("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")
	os.execute("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")

	os.execute("waybar &")
	os.execute("swaync &")

	local polkit_paths = {
		"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
		"/usr/lib/polkit-kde-authentication-agent-1",
		"/usr/libexec/polkit-gnome/polkit-gnome-authentication-agent-1",
		"/usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1",
		"/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1",
	}

	for _, path in ipairs(polkit_paths) do
		local file = io.open(path, "r")
		if file then
			file:close()
			os.execute(path .. " &")
			break
		end
	end

	local wallpaperPath = homeDir .. "/.config/hypr/wallpaper.jpg"
	local wpFile = io.open(wallpaperPath, "r")
	if wpFile then
		wpFile:close()
		os.execute("awww-daemon --format xrgb &")
		os.execute("sleep 0.5 && awww img " .. wallpaperPath .. " &")
	else
		print("Wallpaper not found, skipping awww daemon!")
	end

	os.execute("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
	os.execute("gsettings set org.gnome.desktop.interface gtk-theme 'Andromeda-dark'")
	os.execute("gsettings set org.gnome.desktop.interface icon-theme 'Flat-Remix-Blue-Dark'")
	os.execute("gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'")
	os.execute("gsettings set org.gnome.desktop.interface cursor-size 24")

	--os.execute("kvantummanager --set 'Catppuccin-Mocha' >/dev/null 2>&1 &")

	os.execute("sleep 1 && systemctl --user restart xdg-desktop-portal xdg-desktop-portal-hyprland &")
end)
