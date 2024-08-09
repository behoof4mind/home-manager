return {
  {
    "epwalsh/obsidian.nvim",
    version = "v3.9.0",
    lazy = true,
    ft = "markdown",
    -- event = {
    --   "BufReadPre /Users/dlavrushko/MyGitHub/notes/**/**.md",
    --   "BufNewFile /Users/dlavrushko/MyGitHub/notes/**/**.md",
    -- },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/MyGitHub/notes/",
        },
      },
      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
      },
    },
  },
}
