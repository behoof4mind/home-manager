-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
--
local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
  group = autocmd_group,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { ".aerospace.toml" },
  callback = function()
    vim.cmd(":!aerospace reload-config")
  end,
  group = autocmd_group,
})
