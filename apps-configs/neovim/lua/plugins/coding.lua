return {
  -- {
  --   "https://codeberg.org/esensar/nvim-dev-container",
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  --   config = function()
  --     require("devcontainer").setup({})
  --   end,
  --   opts = {
  --     compose_command = "podman-compose",
  --   },
  -- },
  -- {
  --   "nvim-java/nvim-java",
  --   config = false,
  --   dependencies = {
  --     {
  --       "neovim/nvim-lspconfig",
  --       opts = {
  --         servers = {
  --           -- Your JDTLS configuration goes here
  --           jdtls = {
  --             settings = {
  --               java = {
  --                 configuration = {
  --                   runtimes = {
  --                     {
  --                       name = "OpenJDK-17",
  --                       path = "/Users/denislavrushko/.nix-profile/bin/java",
  --                     },
  --                   },
  --                 },
  --               },
  --             },
  --           },
  --         },
  --         setup = {
  --           jdtls = function()
  --             -- Your nvim-java configuration goes here
  --             require("java").setup({
  --               root_markers = {
  --                 "settings.gradle",
  --                 "settings.gradle.kts",
  --                 "pom.xml",
  --                 "build.gradle",
  --                 "mvnw",
  --                 "gradlew",
  --                 "build.gradle",
  --                 "build.gradle.kts",
  --               },
  --             })
  --           end,
  --         },
  --       },
  --     },
  --   },
  -- },
  {
    "NachoNievaG/atac.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    config = function()
      require("atac").setup({})
    end,
  },
  {
    "ziontee113/icon-picker.nvim",
    config = function()
      require("icon-picker").setup({ disable_legacy_commands = true })

      local opts = { noremap = true, silent = true }

      vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
      vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
    end,
  },
  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", "~/.config/markdownlint/markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
    lazy = true,
  },
  { "mbbill/undotree" },
  {
    "hashivim/vim-terraform",
  },
  {
    "nvim-lua/plenary.nvim",
  },
  { "tpope/vim-repeat", event = "VeryLazy" },
  {
    "towolf/vim-helm",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "gitignore",
        "git_config",
        "go",
        "gomod",
        "gowork",
        "gosum",
      })
    end,
  },
  {
    "saghen/blink.cmp",
    optional = false,
    dependencies = { "giuxtaposition/blink-cmp-copilot" },
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
  {
    "numToStr/Comment.nvim",
  },
}
