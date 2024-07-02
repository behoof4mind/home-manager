return {
  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
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
  },
  {
    "mfussenegger/nvim-lint",
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
    "ThePrimeagen/harpoon",
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
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").yamlls.setup({
        on_attach = function(client, bufnr)
          local excluded_patterns = { ".+/templates/.+.yaml", ".+/templates/.+%.tpl", ".+%.gotmpl", "helmfile.+%.yaml" }
          local filename = vim.fn.expand("%:p")
          for _, pattern in ipairs(excluded_patterns) do
            if string.match(filename, pattern) then
              vim.lsp.stop_client(client.id)
            end
          end
        end,
      })
      require("lspconfig").bashls.setup({})
      require("lspconfig").golangci_lint_ls.setup({})
      require("lspconfig").gopls.setup({})
      require("lspconfig").helm_ls.setup({})
      require("lspconfig").jsonls.setup({})
      require("lspconfig").lua_ls.setup({})
      require("lspconfig").marksman.setup({})
      require("lspconfig").terraformls.setup({})
      require("lspconfig").nil_ls.setup({})
      require("lspconfig").vuels.setup({})
      require("lspconfig").dockerls.setup({})
      require("lspconfig").docker_compose_language_service.setup({})
      require("lspconfig").ansiblels.setup({})
      require("lspconfig").sqlls.setup({})
      require("lspconfig").pylsp.setup({})
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        -- stylua: ignore
        keys = {
          { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
          { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
        },
        opts = {},
        config = function(_, opts)
          require("dap.ext.vscode").load_launchjs()
          local dap = require("dap")
          local dapui = require("dapui")
          dapui.setup(opts)
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
          end
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },
    keys = {
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Breakpoint Condition",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>da",
        function()
          require("dap").continue({ before = get_args })
        end,
        desc = "Run with Args",
      },
      {
        "<leader>dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "<leader>dg",
        function()
          require("dap").goto_()
        end,
        desc = "Go to line (no execute)",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>dj",
        function()
          require("dap").down()
        end,
        desc = "Down",
      },
      {
        "<leader>dk",
        function()
          require("dap").up()
        end,
        desc = "Up",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last",
      },
      {
        "<leader>do",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>dp",
        function()
          require("dap").pause()
        end,
        desc = "Pause",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>ds",
        function()
          require("dap").session()
        end,
        desc = "Session",
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>dw",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Widgets",
      },
    },
    config = function()
      local Config = require("lazyvim.config")
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      for name, sign in pairs(Config.icons.dap) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end
    end,
  },
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup({})
    end,
  },
  {
    "fatih/vim-go",
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "numToStr/Comment.nvim",
  },
}
