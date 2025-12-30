local horizontal_border = { " ", "─", " ", " ", " ", "─", " ", " " }

return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      format = {
        cmdline = { title = "" },
        filter = { title = "" },
        lua = { title = "" },
        help = { title = "" },
      },
    },
    views = {
      cmdline_input = {
        border = {
          style = horizontal_border,
          text = { top_align = "left" },
        },
      },
      cmdline_popup = {
        border = {
          style = horizontal_border,
          text = { top_align = "left" },
        },
      },
    },
  },
}
