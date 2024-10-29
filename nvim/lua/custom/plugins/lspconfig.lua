-- custom.plugins.lspconfig
-- local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities
--
-- local lspconfig = require "lspconfig"
-- local servers = { "html", "cssls", "clangd", "pyright"}
--
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

-- python
local pyright = require("custom.configs.python")
require("lspconfig").pyright.setup{pyright.default_config}

-- java
-- local jdtls = require("custom.configs.jdtls")
-- require'lspconfig'.jdtls.setup{jdtls.default_config}
