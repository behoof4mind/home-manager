return {
  "nvim-telescope/telescope.nvim",
  config = function()
    require("telescope").load_extension("yaml_schema")
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
      },
    })
  end,
}
