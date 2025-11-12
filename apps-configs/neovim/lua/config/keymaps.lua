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
-- map("n", "<leader>ft", "<Nop>")
-- map("n", "<leader>fT", "<Nop>")
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
map("n", "<leader>su", function()
  Snacks.picker.undo()
end, { desc = "UndoTree" })

local wk = require("which-key")
wk.add({
  -- Octo group
  { "<leader>O", group = "Octo" },

  { "<leader>Oi", group = "Issue (Octo)" },
  { "<leader>Oil", ":Octo issue list<CR>", desc = "List" },
  { "<leader>Ois", ":Octo issue search<CR>", desc = "Search" },

  { "<leader>OR", group = "Repo (Octo)" },
  { "<leader>ORl", ":Octo repo list<CR>", desc = "List" },
  { "<leader>ORb", ":Octo repo browser<CR>", desc = "Open in Browser" },
  { "<leader>ORy", ":Octo repo url<CR>", desc = "Yank url" },
  { "<leader>ORv", ":Octo repo view<CR>", desc = "View" },

  { "<leader>Op", group = "PR (Octo)" },
  { "<leader>Opn", "<cmd>Octo pr create draft<CR>", desc = "Create PR draft", mode = "n" },
  { "<leader>Opb", "<cmd>Octo pr browser<CR>", desc = "Open in Browser", mode = "n" },
  { "<leader>Opc", "<cmd>Octo pr changes<CR>", desc = "Changes", mode = "n" },
  { "<leader>OpC", "<cmd>Octo pr checkout<CR>", desc = "Checkout", mode = "n" },
  { "<leader>Opd", "<cmd>Octo pr diff<CR>", desc = "Show diff", mode = "n" },
  { "<leader>OpD", "<cmd>Octo pr draft<CR>", desc = "Change to draft", mode = "n" },
  { "<leader>Opm", "<cmd>Octo pr merge<CR>", desc = "Merge", mode = "n" },
  { "<leader>Opr", "<cmd>Octo pr ready<CR>", desc = "Change to ready", mode = "n" },
  { "<leader>OpR", "<cmd>Octo pr reload<CR>", desc = "Reload PR", mode = "n" },
  { "<leader>Opx", "<cmd>Octo pr close<CR>", desc = "Close PR", mode = "n" },
  { "<leader>Opy", "<cmd>Octo pr url<CR>", desc = "Yank url", mode = "n" },

  { "<leader>Oc", group = "Comment (Octo)" },
  { "<leader>Oca", "<cmd>Octo comment add<CR>", desc = "Add", mode = "n" },
  { "<leader>Ocd", "<cmd>Octo comment delete<CR>", desc = "Delete", mode = "n" },
  { "<leader>Ocr", "<cmd>Octo comment reply<CR>", desc = "Reply", mode = "n" },
  { "<leader>Ocs", "<cmd>Octo comment suggest<CR>", desc = "Suggest", mode = "n" },
  { "<leader>Ocy", "<cmd>Octo comment url<CR>", desc = "Yank url", mode = "n" },

  { "<leader>Oa", group = "Assignee (Octo)" },
  { "<leader>Oaa", "<cmd>Octo assignee add<CR>", desc = "Add", mode = "n" },
  { "<leader>Oar", "<cmd>Octo assignee remove<CR>", desc = "Remove", mode = "n" },

  { "<leader>Or", group = "Review (Octo)" },
  { "<leader>Orb", "<cmd>Octo review browse<CR>", desc = "Open in Browser", mode = "n" },
  { "<leader>Orc", "<cmd>Octo review comments<CR>", desc = "Comments", mode = "n" },
  { "<leader>OrC", "<cmd>Octo review commit<CR>", desc = "Commit", mode = "n" },
  { "<leader>Ord", "<cmd>Octo review discard<CR>", desc = "Discard", mode = "n" },
  { "<leader>Orr", "<cmd>Octo review resume<CR>", desc = "Resume", mode = "n" },
  { "<leader>Ors", "<cmd>Octo review start<CR>", desc = "Start", mode = "n" },
  { "<leader>OrS", "<cmd>Octo review submit<CR>", desc = "Submit", mode = "n" },
  { "<leader>Ort", "<cmd>Octo review thread<CR>", desc = "Thread", mode = "n" },
  { "<leader>Ort", "<cmd>Octo review thread<CR>", desc = "Thread", mode = "n" },
  { "<leader>Orx", "<cmd>Octo review close<CR>", desc = "Close", mode = "n" },

  -- Oil group
  { "<leader>e", group = "Oil Explorer" },
  { "<leader>ec", ":Oil --float<CR>", desc = "Current directory", mode = "n" },
  { "<leader>ef", ":Oil ~/Workplace/ftapi --float<CR>", desc = "Ftapi directory", mode = "n" },
  { "<leader>eh", ":Oil ~/.config/home-manager --float<CR>", desc = "Home-manager directory", mode = "n" },

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
