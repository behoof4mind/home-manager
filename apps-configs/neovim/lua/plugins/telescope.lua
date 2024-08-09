return {
  "nvim-telescope/telescope.nvim",
  config = function()
    require("telescope").load_extension("yaml_schema")
    require("telescope").load_extension("ssh-config")
    require("telescope").setup({
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = function()
            return { "--hidden", "--glob", "!**/.git/*" }
          end,
        },
        grep_string = {
          additional_args = function()
            return { "--hidden", "--glob", "!**/.git/*" }
          end,
        },
        extensions = {
          ["ssh-config"] = {
            client = "oil",
            ssh_config_path = "~/.ssh/config",
          },
        },
      },
    })
  end,
}
