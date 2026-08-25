return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    cmd = {
      "ClaudeCode", "ClaudeCodeFocus", "ClaudeCodeSelectModel",
      "ClaudeCodeAdd", "ClaudeCodeSend", "ClaudeCodeTreeAdd",
      "ClaudeCodeStatus", "ClaudeCodeStart", "ClaudeCodeStop",
      "ClaudeCodeOpen", "ClaudeCodeClose", "ClaudeCodeDiffAccept",
      "ClaudeCodeDiffDeny", "ClaudeCodeCloseAllDiffs",
    },
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
      { "<leader>aa", "<cmd>ClaudeCodeAdd<cr>", desc = "Add file to Claude context" },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      suggestion = {
        enabled = not vim.g.ai_cmp,
        auto_trigger = true,
        hide_during_completion = vim.g.ai_cmp,
        keymap = {
          accept = false, -- handled by nvim-cmp / blink.cmp
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
        yaml = true,
        terraform = true,
      },
    },
  },
}
