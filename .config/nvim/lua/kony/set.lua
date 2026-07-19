vim.g.moonflyTerminalColors = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.number = true
vim.opt.relativenumber = true -- use relative line numbers

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	signs = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.opt.wrap = false

vim.opt.incsearch = true -- incremental search

vim.opt.langmap =
	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

vim.opt.termguicolors = true

-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	pattern = "*",
-- 	callback = function()
-- 		-- Force variables inside macros to look like normal Treesitter variables
-- 		vim.api.nvim_set_hl(0, "@lsp.typemod.variable.macro.rust", { link = "@variable" })
-- 		vim.api.nvim_set_hl(0, "@lsp.typemod.variable.procMacro.rust", { link = "@variable" })
--
-- 		-- Force functions inside macros to look like normal functions
-- 		vim.api.nvim_set_hl(0, "@lsp.typemod.function.macro.rust", { link = "MoonflySky" })
-- 		vim.api.nvim_set_hl(0, "@lsp.typemod.function.procMacro.rust", { link = "MoonflySky" })
-- 		vim.api.nvim_set_hl(0, "@lsp.typemod.function.public.rust", { link = "MoonflySky" })
--
-- 		-- Ignore macro modifiers for everything else
-- 		vim.api.nvim_set_hl(0, "@lsp.mod.macro.rust", {})
-- 		vim.api.nvim_set_hl(0, "@lsp.mod.procMacro.rust", {})
-- 	end,
-- })

vim.cmd.colorscheme("moonfly")

-- Disalbe ANNOYING MENU
vim.keymap.set("n", "<F1>", "<Nop>", { noremap = true, silent = true })
