-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- decode base64 on-the-fly and show or decode and add to the buffer
vim.keymap.set("v", "<leader>64", "y:let @+ = system('base64 --decode', @\")<cr><esc>")
vim.keymap.set("v", "<leader><leader>64", "y:echo system('base64 --decode', @\")<cr>")

-- LSP HotKeys
map("n", "gr", vim.lsp.buf.references, { desc = "GoTo references" })
map("n", "gd", vim.lsp.buf.definition, { desc = "GoTo definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "GoTo declaration" })
map("n", "K", vim.lsp.buf.hover, { desc = "GoTo hover" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "GoTo implementation" })
map("n", "<C-h>", vim.lsp.buf.signature_help, { desc = "GoTo signature_help" })
map("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "GoTo type_definition" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "GoTo rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "GoTo code_action" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "GoTo code_action" })
map("n", "<leader>cu", vim.cmd.UndotreeToggle, { desc = "Open UndoTree" })
vim.api.nvim_set_keymap(
  "n",
  "<leader>hh",
  [[:lua require("harpoon.ui").toggle_quick_menu()<CR>]],
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>ha",
  [[:lua require("harpoon.mark").add_file()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>hn",
  [[:lua require("harpoon.ui").nav_next()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>hp",
  [[:lua require("harpoon.ui").nav_prev()<CR>]],
  { noremap = true, silent = true }
)
