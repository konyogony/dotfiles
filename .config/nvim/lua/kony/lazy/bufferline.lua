return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"bluz71/vim-moonfly-colors",
	},
	config = function()
		require("bufferline").setup({})
	end,
}
