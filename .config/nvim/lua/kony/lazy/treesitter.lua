return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local configs = require("nvim-treesitter")
		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"elixir",
				"javascript",
				"html",
				"python",
				"typescript",
				"rust",
				"css",
				"java",
				"kotlin",
				"json",
				"toml",
				"yaml",
				"markdown",
				"markdown_inline",
				"bash",
				"wgsl",
			},
			sync_install = false,
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"elixir",
				"javascript",
				"html",
				"python",
				"typescript",
				"rust",
				"css",
				"java",
				"kotlin",
				"json",
				"toml",
				"yaml",
				"markdown",
				"bash",
				"wgsl",
			},
			callback = function()
				vim.bo.syntax = ""
				vim.treesitter.start()
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
