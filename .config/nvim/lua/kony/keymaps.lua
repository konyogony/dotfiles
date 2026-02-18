local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<C-w>", "<cmd>bd<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<C-t>", "<cmd>enew<CR>", { desc = "Open new empty buffer" })
-- vim.keymap.set("n", "<C-s>", "<cmd>BufferLineCloseOther<CR>", { desc = "Close all other buffers, except for the current one" })
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeFocus<CR>", { desc = "Focus on NvimTree" })
vim.keymap.set("n", "<C-m>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

-- These two dont work for some reason, while the commands executed manually work perfectly fine. :/
vim.keymap.set("n", "<C-Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Cycle to the next buffer" })
vim.keymap.set("n", "<C-s-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Cycle to the previous buffer" })

for i = 1, 9 do
	vim.keymap.set("n", "<C-" .. i .. ">", "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", { desc = "Go to buffer " .. i })
end

function toggle_diagnostics_virtual()
	local current_config = vim.diagnostic.config()
	if not current_config then
		return
	end
	local new_config = not current_config.virtual_text

	vim.diagnostic.config({
		virtual_text = new_config,
		virtual_lines = not new_config,
	})
end

vim.keymap.set("n", "<C-d>", toggle_diagnostics_virtual, { desc = "Toggle diagnostics virtual text" })
vim.keymap.set("n", "x", '"_x', { desc = "Delete character without copying" })
-- vim.keymap.set("n", "K", function()
-- 	vim.cmd.RustLsp({ "hover", "actions" })
-- end, { silent = true, buffer = bufnr })

vim.api.nvim_set_keymap(
	"n",
	"<leader>e",
	[[:lua YankDiagnosticError()<CR>]],
	{ noremap = true, silent = true, desc = "Copy error" }
)

function YankDiagnosticError()
	local bufnr = vim.api.nvim_get_current_buf()
	local diagnostics = vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR })

	if #diagnostics == 0 then
		vim.notify("No errors in this buffer", vim.log.levels.INFO)
		return
	end

	-- Cursor line (0-based)
	local line = vim.api.nvim_win_get_cursor(0)[1] - 1

	-- Filter diagnostics on the current line
	local same_line_diags = {}
	for _, d in ipairs(diagnostics) do
		if d.lnum == line then
			same_line_diags[#same_line_diags + 1] = d
		end
	end

	if #same_line_diags == 0 then
		vim.notify("No errors on this line", vim.log.levels.INFO)
		return
	end

	local filepath = vim.api.nvim_buf_get_name(bufnr)
	local filename = vim.fn.fnamemodify(filepath, ":t")
	local lineno = line + 1 -- convert to 1-based

	-- Collect all messages for the line
	local msgs = {}
	for _, d in ipairs(same_line_diags) do
		msgs[#msgs + 1] = d.message:gsub("\n", " ") -- flatten multiline
	end

	-- Join them with `; ` (change to "\n" if you want multiline)
	local all_msgs = table.concat(msgs, "; ")
	local result = string.format("%s:%d - %s", filename, lineno, all_msgs)

	-- Yank to system clipboard
	vim.fn.setreg("+", result)
	vim.notify("Copied: " .. result, vim.log.levels.INFO)
end
