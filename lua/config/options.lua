-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0.02
  vim.g.neovide_padding_top = 8
  vim.g.neovide_padding_left = 12
  vim.g.neovide_padding_right = 8
  vim.g.neovide_floating_shadow = false

  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
      vim.g.neovide_scroll_animation_length = vim.bo.buftype == "snacks_terminal" and 0 or 0.3
    end,
  })
end

vim.g.lazyvim_rust_diagnostics = "bacon-ls"
vim.g.root_spec = {
  { ".git", "Cargo.lock" },
  "lsp",
  "cwd",
}
