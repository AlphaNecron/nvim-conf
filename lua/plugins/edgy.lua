return {
  "folke/edgy.nvim",
  opts = {
    animate = { enabled = false },
    icons = { closed = "", open = "" },
    wo = {
      winbar = true,
    },
    options = {
      bottom = { size = 10 },
      left = { size = 30, wo = { winbar = false } },
      right = { size = 30 },
    },
    left = {
      {
        title = "Neo-Tree",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        pinned = true,
        open = "Neotree position=left",
      },
    },
  },
}
