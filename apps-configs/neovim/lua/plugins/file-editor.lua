return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = false,
            hide_gitignored = false,
            bind_to_cwd = false, -- true creates a 2-way binding between vim's cwd and neo-tree's root
            -- cwd_target = {
            --   sidebar = "global", -- sidebar is when position = left or right
            --   current = "global", -- current is when position = current
            -- },
          },
          follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer every time
            --               -- the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
        },
        window = {
          position = "left",
          width = 40,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["<tab>"] = function(state)
              local node = state.tree:get_node()
              if require("neo-tree.utils").is_expandable(node) then
                state.commands["toggle_node"](state)
              else
                state.commands["open"](state)
                vim.cmd("Neotree reveal")
              end
            end,
            ["T"] = "open_tab_drop",
            ["<tab>"] = function(state)
              state.commands["open"](state)
              vim.cmd("Neotree reveal")
            end,
          },
        },
        event_handlers = {
          {
            event = "file_opened",
            handler = function()
              --auto close
              require("neo-tree").close_all()
            end,
          },
        },
      })
    end,
  },
}
