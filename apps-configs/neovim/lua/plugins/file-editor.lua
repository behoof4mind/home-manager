return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      view_options = {
        show_hidden = true,
      },
      default_floating_win = true,
      keymaps = {
        ["-"] = function()
          require("oil.actions").parent.callback()
          vim.cmd.lcd(require("oil").get_current_dir())
        end,
        ["<CR>"] = function()
          require("oil").select(nil, function(err)
            if not err then
              local curdir = require("oil").get_current_dir()
              if curdir then
                vim.cmd.lcd(curdir)
              end
            end
          end)
        end,
      },
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
}
