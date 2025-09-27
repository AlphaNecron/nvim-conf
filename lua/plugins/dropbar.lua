return {
  {
    "Bekaboo/dropbar.nvim",
    event = "VimEnter",
    init = function()
      vim.ui.select = require("dropbar.utils.menu").select
    end,
    config = function(_, opts)
      require("dropbar").setup(opts)
      -- local ns = vim.api.nvim_get_namespaces()
      -- vim.api.nvim_set_hl(ns["DropBarExtmarks"], "Cursor", {
      --   blend = 100,
      -- })
    end,
    opts = {
      bar = {
        keymaps = {
          ["<Tab>"] = function()
            require "dropbar.utils.menu"
          end,
        },
      },
    },
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
}
