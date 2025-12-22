return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  cmd = "Leet",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lang = "cpp",
  },
  keys = {
    { "<leader>ls", "<cmd>Leet submit<cr>", desc = "Submit" },
    { "<leader>lr", "<cmd>Leet run<cr>", desc = "Run" },
  },
}
