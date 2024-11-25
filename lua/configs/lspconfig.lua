local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "clangd", "basedpyright", "gopls" }

local _on_attach = {
  clangd = function()
    require("clangd_extensions.inlay_hints").setup_autocmd()
    require("clangd_extensions.inlay_hints").set_inlay_hints()
  end,
}

for _, lsp in pairs(servers) do
  local attach_ev = _on_attach[lsp]
  lspconfig[lsp].setup {
    on_attach = attach_ev and function()
      attach_ev()
      on_attach()
    end or on_attach,
    on_init = on_init,
    capabilities = capabilities,
    single_file_support = true,
  }
end
