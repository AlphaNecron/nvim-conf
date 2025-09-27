local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")

local servers = { "clangd", "basedpyright", "gopls" }

local _on_attach = {
  clangd = function()
    -- require("clangd_extensions.inlay_hints").setup_autocmd()
    -- require("clangd_extensions.inlay_hints").set_inlay_hints()
  end,
}

for _, lsp in pairs(servers) do
  local attach_ev = _on_attach[lsp]
  lspconfig[lsp].setup {
      settings = {
        clangd = {
          InlayHints = {
            Designators = true,
            Enabled = true,
            ParameterNames = true,
            DeducedTypes = true,
          },
          fallbackFlags = { "-std=c++20" },
        },
      },
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      if attach_ev then
        attach_ev()
      end
    end or on_attach,
    on_init = on_init,
    capabilities = capabilities,
    single_file_support = true,
  }
end
