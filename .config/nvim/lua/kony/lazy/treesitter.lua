return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local ts = require("nvim-treesitter")

		local ensure_installed = {
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
		}

		local already_installed = ts.get_installed() or {}
		local to_install = vim.iter(ensure_installed)
			:filter(function(parser)
				return not vim.tbl_contains(already_installed, parser)
			end)
			:totable()

		if #to_install > 0 then
			ts.install(to_install)
		end

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)

				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
