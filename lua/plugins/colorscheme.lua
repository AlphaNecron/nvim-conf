return {
  {
    "catppuccin/nvim",
    opts = {
      term_colors = true,
      float = {
        solid = true,
      },
      custom_highlights = function(colors)
        return {
          UwU = { fg = colors.mauve, bg = colors.base, style = { "bold" } },
        }
      end,
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
