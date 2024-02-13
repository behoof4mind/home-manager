-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
--
-- Fix conceallevel for markdown files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "md" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})
