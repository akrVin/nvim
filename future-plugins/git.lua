return {
	"tpope/vim-fugitive",
	lazy = false, -- Загружать сразу для быстрого доступа к командам
	config = function()
		-- Открыть статус Fugitive
		vim.keymap.set("n", "<leader>gs", ":Gstatus<CR>") -- или :Git
		-- Просмотр изменений (diff)
		vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>")
		-- Добавить файл (commit)
		vim.keymap.set("n", "<leader>ga", ":Gwrite<CR>")
		-- Зафиксировать изменения (commit)
		vim.keymap.set("n", "<leader>gc", ":Gcommit<CR>")
	end,
}
