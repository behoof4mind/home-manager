return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["go"] = { "gofmt" },
        ["nix"] = { "nixfmt" },
        ["tf"] = { "terraform_fmt" },
        ["json"] = { "jq" },
        ["hcl"] = { "hclfmt" },
        -- ["yaml"] = { "yq" },
      },
    },
    formatters = {
      yamlfix = {
        -- Change where to find the command
        command = "local/path/yamlfix",
        -- Adds environment args to the yamlfix formatter
        env = {
          YAMLFIX_SEQUENCE_STYLE = "block_style",
        },
      },
    },
  },
}
