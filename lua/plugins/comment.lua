return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			ignore = "^$",
			toggler = {
				line = "<C-/>",
				block = "<leader>b/",
            },
			opleader = {
				line = "<leader>c",
				block = "<C-b>",
			},
		})
	end,
}
