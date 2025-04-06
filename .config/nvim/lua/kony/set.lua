vim.cmd.colorscheme("moonfly")
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
