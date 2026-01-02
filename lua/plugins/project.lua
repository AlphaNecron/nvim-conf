return {
  {
    "coffebar/neovim-project",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "Shatur/neovim-session-manager",
    },
    opts = {
      projects = {
        "/data/Dev/*",
      },
      picker = {
        type = "snacks",
      },
      dashboard_mode = true,
    },
    init = function()
      vim.opt.sessionoptions:append("globals")
    end,
    cmd = { "NeovimProjectDiscover" },
  },
  { "folke/persistence.nvim", enabled = false },
}
