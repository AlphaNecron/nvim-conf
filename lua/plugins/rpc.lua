return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  opts = {
    display = {
      theme = "catppuccin",
      flavor = "accent",
    },
    editor = {
      client = "vim",
      tooltip = "necronuwu",
      icon = "https://necron.dev/favicon.png",
    },
  },
}
