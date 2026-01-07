return {
  "kndndrj/nvim-dbee",
  dependencies = { "MunifTanjim/nui.nvim" },
  enabled = false,
  build = function()
    require("dbee").install()
  end,
  opts = {},
  keys = {
    { "<leader>De", "<cmd>Dbee<cr>", desc = "Database explorer" },
  },
}
