-- FLAMESHOT
hl.window_rule({
	match = { class = "^(flameshot)$" },
	float = true,
	move = "0 0",
	pin = true,
	no_anim = true,
})

-- CENTERED WINDOWS
hl.window_rule({
	match = { class = "^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$" },
	center = true,
})

-- PICTURE-IN-PICTURE
hl.window_rule({
	match = { title = "^(Picture-in-Picture)$" },
	float = true,
	move = "72% 7%",
	size = "25% 25%",
	pin = true,
})

-- FLOATING WINDOWS
hl.window_rule({ match = { class = "^(org.kde.polkit-kde-authentication-agent-1)$" }, float = true })
hl.window_rule({ match = { class = "^(xdg-desktop-portal-gtk)$" }, float = true })
hl.window_rule({ match = { class = "^([Rr]ofi)$" }, float = true })
hl.window_rule({ match = { class = "^(mpv)$" }, float = true })

-- STEAM
hl.window_rule({
	match = { class = "^([Ss]team)$", title = "^((?![Ss]team).*|[Ss]team [Ss]ettings)$" },
	float = true,
})

-- SIZES
hl.window_rule({ match = { class = "^(xdg-desktop-portal-gtk)$" }, size = "70% 70%" })
