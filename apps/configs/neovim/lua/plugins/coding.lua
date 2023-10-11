return {
  { "tpope/vim-repeat", event = "VeryLazy" },
  {
    "towolf/vim-helm",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").helm_ls.setup({})
    end,
  },
  { "mfussenegger/nvim-dap" },
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup({})
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
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
