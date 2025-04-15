return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6", -- or, branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim", "tiagovla/scope.nvim" },
	config = function()
		-- Load the 'scope' extension for telescope
		require("telescope").load_extension("scope")

		-- Set up keymaps for telescope commands
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>fl", builtin.live_grep, { noremap = true, silent = true })
		vim.keymap.set("n", ";", builtin.buffers, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { noremap = true, silent = true })
	end,
}
