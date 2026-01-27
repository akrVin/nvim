vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set smarttab")
vim.cmd("set autoindent")
vim.opt.cursorline = true

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>s", ":source %<CR>")
  
         
-- Bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--branch=stable",
      lazyrepo,
      lazypath 
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
-- return {
--     "windwp/nvim-ts-autotag",
--     event = "LazyFile",
--     opts = {
--        'html',
--        'jsx'
--     }
-- }

require("lazy").setup("plugins")
-- Default options:
-- require('nvim-ts-autotag').setup({
--   opts = {
--     -- Defaults
--     enable_close = true, -- Auto close tags
--     enable_rename = true, -- Auto rename pairs of tags
--     enable_close_on_slash = false -- Auto close on trailing </
--   },
--   -- Also override individual filetype configs, these take priority.
--   -- Empty by default, useful if one of the "opts" global settings
--   -- doesn't work well in a specific filetype
--   per_filetype = {
--     ["html"] = {
--       enable_close = false
--     }
--   }
-- })

