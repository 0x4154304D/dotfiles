-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- python
require("custom.lsp.pyright").setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- require("custom.lsp.java").setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }
--
-- require("spring_boot").setup {
--   server = {
--   on_attach = on_attach,
--     on_init = function(client, ctx)
--       on_init(client, ctx)
--       client.server_capabilities.documentHighlightProvider = false
--     end,
--     capabilities = capabilities,
--   },
-- }
--
-- require("custom.lsp.sonarlint").setup()
