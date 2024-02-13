return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = {
      "BufReadPre /Users/dlavrushko/MyGitHub/notes/**.md",
      "BufNewFile /Users/dlavrushko/MyGitHub/notes/**.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "/Users/dlavrushko/MyGitHub/notes/",
        },
      },
    },
  },
}
