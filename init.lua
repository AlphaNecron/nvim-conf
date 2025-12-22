-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0.02
  vim.g.neovide_padding_top = 8
  vim.g.neovide_floating_shadow = false
end
