return {
  {
    "pwntester/octo.nvim",
    opts = {
      enable_builtin = true,
      default_to_projects_v2 = true,
      default_merge_method = "squash",
      picker = "snacks",
    },
    keys = {
      { "<leader>gi", "<cmd>Octo issue list<CR>", desc = "List Issues (Octo)" },
      { "<leader>gI", "<cmd>Octo issue search<CR>", desc = "Search Issues (Octo)" },
      { "<leader>gp", "<cmd>Octo pr list<CR>", desc = "List PRs (Octo)" },
      { "<leader>gP", "<cmd>Octo pr search<CR>", desc = "Search all PRs (Octo)" },
      { "<leader>gr", "<cmd>Octo repo list<CR>", desc = "List Repos (Octo)" },
      { "<leader>gS", "<cmd>Octo search<CR>", desc = "Search (Octo)" },

      { "<localleader>a", "", desc = "+assignee (Octo)", ft = "octo" },

      { "<localleader>p", "", desc = "+pr (Octo)", ft = "octo" },
      { "<localleader>pc", ":Octo pr list_commits<CR>", desc = "+commits (Octo)", ft = "octo" },
      { "<localleader>pC", ":Octo pr close<CR>", desc = "+close (Octo)", ft = "octo" },
      { "<localleader>pb", ":Octo pr browser<CR>", desc = "+browser (Octo)", ft = "octo", silent = true },
      { "<localleader>pf", ":Octo list_changed_files<CR>", desc = "+files (Octo)", ft = "octo" },
      { "<localleader>pl", "", desc = "+label (Octo)", ft = "octo" },
      { "<localleader>pm", ":Octo pr merge<CR>", desc = "+merge (Octo)", ft = "octo" },
      { "<localleader>pu", ":Octo pr reload<CR>", desc = "+reload (Octo)", ft = "octo", silent = true },
      { "<localleader>pr", ":Octo pr ready", desc = "+ready (Octo)", ft = "octo" },
      { "<localleader>ps", "", desc = "+squash (Octo)", ft = "octo" },
      { "<localleader>pv", "", desc = "+review (Octo)", ft = "octo" },
      { "<localleader>py", ":Octo pr url<CR>", desc = "+yank URL (Octo)", ft = "octo", silent = true },

      { "<localleader>i", "", desc = "+issue (Octo)", ft = "octo" },
      { "<localleader>ig", "", desc = "+goto_issue (Octo)", ft = "octo" },
      { "@", "@<C-x><C-o>", mode = "i", ft = "octo", silent = true },
      { "#", "#<C-x><C-o>", mode = "i", ft = "octo", silent = true },
    },
  },
}
