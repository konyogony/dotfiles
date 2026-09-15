vim.g.moonflyTerminalColors = true
vim.opt.termguicolors = true

-- SYstem clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

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

vim.opt.incsearch = true

vim.opt.langmap =
	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

vim.opt.termguicolors = true

vim.cmd.colorscheme("moonfly")

-- Disable annoying menu
vim.keymap.set("n", "<F1>", "<Nop>", { noremap = true, silent = true })
