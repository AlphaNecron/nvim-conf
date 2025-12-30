return {
  "neovim/nvim-lspconfig",
  opts = {
    codelens = {
      enabled = true,
    },
    diagnostics = {
      virtual_text = {
        format = function(d)
          return d.message:sub(1, (d.message:find("\n", 1, true) or 0) - 1)
        end,
      },
    },
  },
}
