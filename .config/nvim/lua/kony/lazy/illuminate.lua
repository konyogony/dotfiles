return {
	"UrsaDK/vim-illuminate",
	config = function()
		require("illuminate").configure({
			filetypes_denylist = {
				"markdown",
				"NvimTree",
				"TelescopePrompt",
				"lsp-hover",
			},
		})
	end,
}
