return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"tiagovla/scope.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").load_extension("scope")
		require("telescope").load_extension("fzf")
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>fl", builtin.live_grep, { noremap = true, silent = true })
		vim.keymap.set("n", ";", builtin.buffers, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { noremap = true, silent = true })
	end,
}
