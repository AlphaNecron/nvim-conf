---@type NvPluginSpec[]
local plugins = {
  {
    "andweeb/presence.nvim",
    lazy = false,
  },
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      color_icons = true,
    },
  },
  {
    "CRAG666/code_runner.nvim",
    config = function()
      require("code_runner").setup {
        filetype = {
          cpp = "g++ -std=c++11 $dir/$fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt < /tmp/input 2> /tmp/output",
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "folke/which-key.nvim",
    enabled = true,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = true,
      },
      update_focused_file = {
        update_root = true,
      },
    },
  },
}

return plugins
