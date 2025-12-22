return {
  {
    "catppuccin/nvim",
    opts = {
      term_colors = true,
      float = {
        solid = true,
      },
      highlight_overrides = {
        all = function(colors)
          return {
            Normal = { bg = colors.mantle },
          }
        end,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
