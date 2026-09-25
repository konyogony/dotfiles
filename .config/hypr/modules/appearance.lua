hl.config({
	general = {
		border_size = 0,
		gaps_in = 4,
		gaps_out = 4,
		resize_on_border = true,
		layout = "dwindle",
		col = {
			active_border = "rgb(1F4358)",
			inactive_border = "rgb(1F4358)",
		},
	},

	decoration = {
		rounding = 20,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		fullscreen_opacity = 1.0,

		dim_inactive = true,
		dim_strength = 0.25,
		dim_special = 0.9,

		shadow = {
			enabled = false,
			range = 3,
			render_power = 1,
			color = "rgb(225267)",
			color_inactive = "rgb(1F4358)",
		},

		blur = {
			enabled = true,
			size = 6,
			passes = 2,
			ignore_opacity = true,
			new_optimizations = true,
			special = true,
			popups = true,
		},
	},

	animations = {
		enabled = false,
	},

	dwindle = {
		preserve_split = true,
		special_scale_factor = 0.8,
	},

	master = {
		new_status = "master",
		new_on_top = true,
		mfact = 0.5,
	},

	group = {
		col = {
			border_active = "rgb(89A4AF)",
		},
		groupbar = {
			col = {
				active = "rgb(4D5055)",
			},
		},
	},

	misc = {
		disable_hyprland_logo = true,
		force_default_wallpaper = 0,
		disable_splash_rendering = true,
		mouse_move_enables_dpms = true,
		enable_swallow = true,
		swallow_regex = "^(kitty)$",
		focus_on_activate = false,
		initial_workspace_tracking = 0,
		middle_click_paste = false,
	},

	binds = {
		workspace_back_and_forth = true,
		allow_workspace_cycles = true,
		pass_mouse_when_bound = false,
	},

	xwayland = {
		force_zero_scaling = true,
	},

	cursor = {
		no_hardware_cursors = true,
		enable_hyprcursor = true,
		warp_on_change_workspace = true,
		no_warps = true,
	},

	render = {
		direct_scanout = 0,
	},
})
