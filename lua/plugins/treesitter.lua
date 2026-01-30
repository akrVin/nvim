return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		-- LazyVim config for treesitter
		indent = { enable = true }, ---@type lazyvim.TSFeat
		highlight = { enable = true }, ---@type lazyvim.TSFeat
		folds = { enable = true }, ---@type lazyvim.TSFeat
		ensure_installed = {
			"html",
			"javascript",
			"jsdoc",
			"json",
			"jsonc",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"xml",
		},
	},
	config = function()
		-- require vim-treesitter'.install ({ 'lua', 'javascript', 'html', 'css' })--:wait(30000)
		-- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		-- vim.wo[0][0].foldmethod = 'expr'
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
}
