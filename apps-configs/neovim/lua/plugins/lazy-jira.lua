return {
  {
    dir = "/Users/denislavrushko/MyGitHub/lazy-jira",
    name = "lazy-jira",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("lazy_jira").setup({
        pandoc_cmd = "pandoc",
        config_file = "/Users/denislavrushko/.lazy-jira.json",
        debug = true,
        layout = "current",
        exclude_columns = { "Backlog" },
        board_line_fields = {
          "key",
          "assignee_initials",
          "type",
          "status",
          "summary",
          "due",
        },
        -- exclude_issue_types = { "Epic", "Sub-task" },
        max_issues_per_column = 200,
        boards = {
          {
            name = "PT-board",
            url = "https://ftapi.atlassian.net/jira/software/c/projects/PT/boards/169",
          },
          {
            name = "3-rd-level-support",
            url = "https://ftapi.atlassian.net/jira/software/c/projects/PT/boards/174",
          },
        },
        fields = {
          epic_link = "customfield_10550",
          epic_name = "customfield_10551",
          story_points = "customfield_10023",
        },
      })
    end,
  },
}
