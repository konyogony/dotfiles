return {
	"andweeb/presence.nvim",
	config = function()
		require("presence"):setup({
			auto_update = true,
			neovim_image_text = "The best terminal editor",
			main_image = "neovim",
			log_level = nil,
			debounce_timeout = 10,
			enable_line_number = false,
			show_timer = true,

			editing_text = "Editing %s",
			file_explorer_text = "Browsing %s",
			git_commit_text = "Committing changes",
			plugin_manager_text = "Managing plugins",
			reading_text = "Reading %s",
			workspace_text = "Working on %s",
			line_number_text = "On line %s out of %s",
		})
	end,
}
