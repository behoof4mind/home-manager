return {
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
      require("lspconfig").helm_ls.setup({})
      require("lspconfig").gopls.setup({})
      require("lspconfig").golangci_lint_ls.setup({})
      require("lspconfig").bashls.setup({})
      require("lspconfig").yamlls.setup({
        on_attach = function(client, bufnr)
          local excluded_patterns = { ".+/templates/.+.yaml", ".+/templates/.+%.tpl", ".+%.gotmpl", "helmfile.+%.yaml" }
          local filename = vim.fn.expand("%:p")
          for _, pattern in ipairs(excluded_patterns) do
            if string.match(filename, pattern) then
              vim.lsp.stop_client(1)
              return
            end
          end
        end,
      })
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
