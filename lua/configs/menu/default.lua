return {
  {
    name = "Code actions",
    cmd = vim.lsp.buf.code_action,
    rtxt = "<leader>ca",
  },
  { name = "separator" },
  {
    name = "  LSP actions",
    hl = "Exblue",
    items = "lsp",
  },
}
