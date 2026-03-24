return {
  { "b0o/SchemaStore.nvim" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              -- 1. Disable the global store to prevent the "Multiple Schemas" error
              schemaStore = {
                enable = false,
                url = "",
              },
              -- 2. Manually find and apply your local schemas
              schemas = (function()
                local schemas = {}
                local schema_file = vim.fs.find("schemas.json", { upward = true, stop = vim.loop.os_homedir() })[1]

                if schema_file then
                  -- Read the local file
                  local f = io.open(schema_file, "r")
                  if f then
                    local content = f:read("*all")
                    f:close()
                    local ok, decoded = pcall(vim.json.decode, content)
                    if ok and decoded.schemas then
                      for _, s in ipairs(decoded.schemas) do
                        schemas[s.url] = s.fileMatch
                      end
                    end
                  end
                end
                -- If schemas.json isn't found or is empty, this returns an empty table
                return schemas
              end)(),
              validate = true,
            },
          },
        },
      },
      setup = {
        ["*"] = function(_, opts)
          vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
            max_width = 80,
            max_height = 20,
          })
        end,
      },
    },
  },
}
