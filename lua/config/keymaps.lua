-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local set = vim.keymap.set
set("n", "<leader>gc", vim.lsp.buf.format, {})
set("i", "jj", "<Esc>", { silent = true })
set({ "n", "v" }, "<leader>j", "<Esc>")
set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
set("n", "gD", vim.lsp.buf.declaration, {})
set("n", "gd", vim.lsp.buf.definition, {})
set("n", "<leader>K", vim.lsp.buf.hover, {})
set("n", "gi", vim.lsp.buf.implementation, {})
set("n", "<C-k>", vim.lsp.buf.signature_help, {})
set("n", "<leader>rn", vim.lsp.buf.rename, {})
set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
set("n", "gr", vim.lsp.buf.references, {})
set({ "n", "t" }, "<c-t>", function()
	Snacks.terminal(nil, { cwd = LazyVim.root() })
end, {
	desc = "Terminal (Root Dir)",
})
