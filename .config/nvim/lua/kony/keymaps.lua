vim.keymap.set("n", "<C-w>", "<cmd>bd<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<C-t>", "<cmd>enew<CR>", { desc = "Open new empty buffer" })
vim.keymap.set("n", "<C-s>", "<cmd>BufferLineCloseOther<CR>", { desc = "Close all other buffers, except for the current one" })

vim.keymap.set("n", "<C-m>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

-- These two dont work for some reason, while the commands executed manually work perfectly fine. :/
vim.keymap.set("n", "<C-Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Cycle to the next buffer" })
vim.keymap.set("n", "<C-s-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Cycle to the previous buffer" })

for i = 1, 9 do
	vim.keymap.set("n", "<C-" .. i .. ">", "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", { desc = "Go to buffer " .. i })
end

