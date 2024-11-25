---@type NvPluginSpec[]
local plugins = {
  {
    "andweeb/presence.nvim",
    opts = {
      main_image = "file",
      neovim_image_text = "necronowo",
    },
  },
  {
    "p00f/clangd_extensions.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "AlphaNecron/cptest.nvim",
    opts = {
      file_types = {
        cpp = {
          compile = function()
            return "mkdir -p /tmp/build && g++ -Wall -std=c++11 -DONLINE_JUDGE -fmax-errors=5 "
              .. vim.fn.expand "%:p"
              .. " -o /tmp/build/"
              .. vim.fn.expand "%:t:r"
          end,
          exec = function()
            return "/tmp/build/" .. vim.fn.expand "%:t:r" .. " < /tmp/input 2> /tmp/output"
          end,
        },
      },
    },
    dir = "/data/Dev/cptest.nvim",
    dev = true,
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
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = true,
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = true,
    requires = { "mfussenegger/nvim-dap" },
  },
  {
    "ojroques/nvim-bufdel",
    lazy = false,
  },
}

return plugins
