return {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	config = function()
		require("mason-lspconfig").setup({
			-- ensure_installed = { "lua_ls" },
			automatic_enable = true,
		})
	end,
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		{
			"neovim/nvim-lspconfig",
			config = function()
				vim.lsp.config("lua_ls", {
					cmd = { "lua-language-server" },
					filetypes = { "lua" },
					root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
					settings = {
						Lua = {
							codeLens = {
								enable = true,
							},
							hint = {
								enable = true,
								semicolon = "Disable",
							},
							runtime = {
								version = "LuaJIT",
							},
						},
					},
				})
				vim.lsp.config("ts_ls", {
					on_attach = function(client, bufnr)
						require("twoslash-queries").attach(client, bufnr)
					end,
					filetypes = {
                        "typescript",
                        "typescriptreact",
                        "typescript.tsx",
                        "javascript",
                        "javascriptreact"
                    },
					cmd = {
                        "typescript-language-server",
                        "--stdio"
                    },
					settings = {
						implicitProjectConfiguration = {
							checkJs = true,
						},
					},
				})
				vim.lsp.enable("ts_ls")
				vim.lsp.enable("lua_ls")
				vim.api.nvim_create_autocmd("LspAttach", {
					group = vim.api.nvim_create_augroup("UserLspConfig", {}),
					callback = function(ev)
						local opts = { buffer = ev.buf }
						vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
						vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
						vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts)
						vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
						vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
						vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
						vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
						vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
						vim.keymap.set("n", "<leader>f", function() end, opts)
					end,
				})
			end,
		},
	},
}
