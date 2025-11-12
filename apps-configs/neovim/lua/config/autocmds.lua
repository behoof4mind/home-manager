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

vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("OilFloatCustom", {}),
  pattern = "OilEnter",
  callback = function()
    local actions = require("oil.actions")
    local util = require("oil.util")
    if util.is_floating_win() then
      vim.keymap.set("n", "<Esc>", actions.close.callback, {
        buffer = true,
      })
      vim.keymap.set("n", "q", actions.close.callback, {
        buffer = true,
      })
    end
  end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "octo",
--   callback = function()
--     vim.cmd("Octo pr url")
--   end,
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "octo",
--   callback = function()
--     local wk = require("which-key")
--     wk.register({
--       c = { ":Octo pr commits<CR>", "List commits" },
--       C = { ":Octo pr changes<CR>", "View changes" },
--       m = { ":Octo pr merge<CR>", "Merge" },
--       r = { ":Octo pr relead<CR>", "Reload" },
--       R = { ":Octo pr ready<CR>", "Mark as ready" },
--       i = { ":Octo pr comment add<CR>", "Add Comment" },
--       e = { ":Octo pr edit<CR>", "Edit" },
--       d = { ":Octo pr diff<CR>", "View Diff" },
--       D = { ":Octo pr draft<CR>", "Mark as Draft" },
--       u = { ":Octo pr url<CR>", "Get URL" },
--       b = { ":Octo pr browser<CR>", "Open in Browser" },
--       x = { ":Octo pr close<CR>", "Close PR" },
--     }, { buffer = true, prefix = "gp" }) -- `gp` directly triggers which-key
--   end,
-- })
