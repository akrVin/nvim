return {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls" },
		})
	end,
	dependencies = {
		{
			"mason-org/mason.nvim",
			config = function()
				require("mason").setup()
			end,
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
				--                vim.lsp.config('ts_ls',{
				--                    init.options = {
				--                        hostInfo = 'neovim'
				--                    },
				--                    cmd = {
				--                        'typescript-language-server', '--stdio'
				--                    },
				--                    filetypes = {
				--                        "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"
				--                    },
				--                    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
				--                    settings = {
				--                        Lua = {
				--                            codeLens = {
				--                                enable = true
				--                            },
				--                            hint = {
				--                                enable = true,
				--                                semicolon = "Disable"
				--                            },
				--                            runtime = {
				--                                version = 'LuaJIT',
				--                            }
				--                        }
				--                    }
				--                })
				--                vim.lsp.config['lua_ls'] = {
				--                    -- Command and arguments to start the server.
				--                    cmd = { 'lua-language-server' },
				--                    -- Filetypes to automatically attach to.
				--                    filetypes = { 'lua' },
				--
				--                    -- Sets the "root directory" to the parent directory of the file in the
				--                    -- current buffer that contains either a ".luarc.json" or a
				--                    -- ".luarc.jsonc" file. Files that share a root directory will reuse
				--                    -- the connection to the same LSP server.
				--                    -- Nested lists indicate equal priority, see |vim.lsp.Config|.
				--                    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
				--
				--                    -- Specific settings to send to the server. The schema for this is
				--                    -- defined by the server. For example the schema for lua-language-server
				--                    -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
				--                    settings = {
				--                        Lua = {
				--                            codeLens = {
				--                                enable = true
				--                            },
				--                            hint = {
				--                                enable = true,
				--                                semicolon = "Disable"
				--                            },
				--                            runtime = {
				--                                version = 'LuaJIT',
				--                            }
				--                        }
				--                    }
				--                }
				--                vim.lsp.config['ts_ls'] = {
				--                    -- Command and arguments to start the server.
				--                    cmd = {
				--                        'typescript-language-server", "--stdio"
				--                    },
				--                    -- Filetypes to automatically attach to.
				--                    filetypes = {
				--                        "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"
				--                    },
				--                    init.options = {
				--                        hostInfo = 'neovim'
				--                    }
				--                },
				-- vim.lsp.config['ts_ls']
				-- :h vim.lsp
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
