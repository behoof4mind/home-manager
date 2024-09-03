return {
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
      require("lspconfig").gopls.setup({})
      require("lspconfig").helm_ls.setup({})
      require("lspconfig").html.setup({})
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
}
