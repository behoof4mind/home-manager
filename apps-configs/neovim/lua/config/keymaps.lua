-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- This file is automatically loaded by lazyvim.config.init
local function map(mode, lhs, rhs, opts)
  -- local keys = require("lazy.core.handler").handlers.keys
  -- ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  -- if not keys.active[keys.parse({ lhs, mode = mode }).id] then
  --   opts = opts or {}
  --   opts.silent = opts.silent ~= false
  --   if opts.remap and not vim.g.vscode then
  --     opts.remap = nil
  --   end
  --   vim.keymap.set(mode, lhs, rhs, opts)
  -- end
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Fix neovim yanking afte paste
map("x", "p", "P", { silent = true })

-- Unmap some LazyVim keybindings
map("n", "<leader>tn", "<Nop>")
map("n", "<leader>tp", "<Nop>")
map("n", "<leader>ft", "<Nop>")
map("n", "<leader>fT", "<Nop>")
map("n", "<c-/>", "<Nop>")
map("n", "<c-/>", "<Nop>")
map("n", "<c-_>", "<Nop>")

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
map("n", "<leader>cu", vim.cmd.UndotreeToggle, { desc = "Open UndoTree" })

local wk = require("which-key")
wk.add({
  -- -- Octo group
  { "<leader>O", group = "Octo" },
  { "<leader>Oc", ":Octo pr create draft<CR>", desc = "Create PR draft", mode = "n" },
  -- Oil group
  { "<leader>e", group = "Oil Explorer" },
  { "<leader>ec", ":Oil --float<CR>", desc = "Current directory", mode = "n" },
  { "<leader>ef", ":Oil ~/Workplace/ftapi --float<CR>", desc = "Ftapi directory", mode = "n" },
  { "<leader>eh", ":Oil ~/.config/home-manager --float<CR>", desc = "Home-manager directory", mode = "n" },
  -- Terminal group
  -- { "<leader>t", group = "Terminal" },
  -- { "<leader>tn", ":ToggleTerm direction=float<CR>", desc = "Open terminal in float window", mode = "n" },
  -- { "<leader>th", ":ToggleTerm direction=horizontal<CR>", desc = "Open terminal in horizontal window", mode = "n" },
  -- { "<leader>tv", ":ToggleTerm size=80 direction=vertical<CR>", desc = "Open terminal in vertical window", mode = "n" },
  -- Debugger group
  -- { "<leader>d", group = "Debugger" },
  -- { "<leader>dO", ":DapStepOver<CR>", desc = "Step over", mode = "n" },
  -- { "<leader>db", ":DapToggleBreakpoint<CR>", desc = "Toggle breakpoint", mode = "n" },
  -- { "<leader>dc", ":DapContinue<CR>", desc = "Continue", mode = "n" },
  -- { "<leader>di", ":DapStepInto<CR>", desc = "Step into", mode = "n" },
  -- { "<leader>dn", ":DapNew<CR>", desc = "Start debugger", mode = "n" },
  -- { "<leader>do", ":DapStepOut<CR>", desc = "Step out", mode = "n" },
  -- { "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", desc = "Reset UI", mode = "n" },
  -- { "<leader>dt", ":DapTerminate<CR>", desc = "Terminate", mode = "n" },
  -- { "<leader>du", ":lua require('dapui').toggle({})<CR>", desc = "Toggle UI", mode = "n" },
  -- {
  --   mode = { "n", "v" },
  --   { "<leader>de", ":lua require('dapui').eval()<CR>", desc = "Evaluate" },
  -- },
  -- Obsidian group
  { "<leader>o", group = "Obsidian" },
  {
    "<leader>od",
    function()
      local handle = io.popen(
        "lua /Users/denislavrushko/MyGitHub/notes/scripts/create_repo.lua --template='/Users/denislavrushko/MyGitHub/notes/templates/daily.mustache' --tag='ftapi' --tag='daily-notes'"
      )
      if handle then
        local result = handle:read("*a")
        handle:close()
        local filepath = result:gsub("%s+", "") -- Remove trailing newlines/spaces
        if filepath and filepath ~= "" then
          vim.cmd("e " .. vim.fn.fnameescape(filepath)) -- Open the file in the current buffer
        end
      end
    end,
    desc = "new daily note",
    mode = "n",
  },
  {
    "<leader>ol",
    function()
      local handle = io.popen(
        "lua /Users/denislavrushko/MyGitHub/notes/scripts/create_repo.lua --template='/Users/denislavrushko/MyGitHub/notes/templates/daily.mustache' --tag='ftapi' --tag='learned'"
      )
      if handle then
        local result = handle:read("*a")
        handle:close()
        local filepath = result:gsub("%s+", "") -- Remove trailing newlines/spaces
        if filepath and filepath ~= "" then
          vim.cmd("e " .. vim.fn.fnameescape(filepath)) -- Open the file in the current buffer
        end
      end
    end,
    desc = "new learned note",
    mode = "n",
  },
  {
    "<leader>op",
    function()
      local handle = io.popen(
        "lua /Users/denislavrushko/MyGitHub/notes/scripts/create_repo.lua --template='/Users/denislavrushko/MyGitHub/notes/templates/daily.mustache' --tag='ftapi' --tag='personal'"
      )
      if handle then
        local result = handle:read("*a")
        handle:close()
        local filepath = result:gsub("%s+", "") -- Remove trailing newlines/spaces
        if filepath and filepath ~= "" then
          vim.cmd("e " .. vim.fn.fnameescape(filepath)) -- Open the file in the current buffer
        end
      end
    end,
    desc = "new personal note",
    mode = "n",
  },
  { "<leader>of", ":ObsidianQuickSwitch<CR>", desc = "Search for note", mode = "n" },
  { "<leader>oc", ":ObsidianToggleCheckbox<CR>", desc = "Insert toggle checkbox", mode = "n" },
})
