return {
  {
    "someone-stole-my-name/yaml-companion.nvim",
    requires = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
    end,
  },
  {
    "mfussenegger/nvim-lint",
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
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
      require("lspconfig").rnix.setup({})
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
  { "mfussenegger/nvim-dap" },
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
