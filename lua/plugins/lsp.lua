return {
  "neovim/nvim-lspconfig",
  opts = {
    codelens = {
      enabled = true,
    },
    diagnostics = {
      virtual_text = {
        prefix = function(d, i, total)
          local icons = { "", "", "", "" }
          return icons[d.severity] .. (i < total and " " or "")
        end,
        format = function(d)
          local rs = d.source == "rust-analyzer" or d.source == "bacon-ls"
          local msg = rs and d.message:gsub("^%w+%[(%w+)%]: ", "%1: ") or d.message
          return msg:sub(1, (msg:find("\n", 1, true) or 0) - 1)
        end,
      },
    },
  },
}
