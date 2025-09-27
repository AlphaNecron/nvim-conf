---@type NvPluginSpec[]
return {
  {
    "andweeb/presence.nvim",
    event = "VimEnter",
    opts = {
      main_image = "file",
      neovim_image_text = "necronowo",
    },
  },
  {
      "MysticalDevil/inlay-hints.nvim",
      event = "LspAttach",
      dependencies = { "neovim/nvim-lspconfig" },
      config = function()
          require("inlay-hints").setup()
      end
  },
  {
    "p00f/clangd_extensions.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
  {
    "wakatime/vim-wakatime",
    event = "BufReadPost",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "Shatur/neovim-session-manager",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      autosave_ignore_dirs = { "/tmp" },
    },
    init = function()
      vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        callback = function()
          for _, buf in pairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "nofile" then
              return
            end
          end
          require("session_manager").save_current_session()
        end,
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = true,
    event = "User FilePost",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      -- {
      --   "natecraddock/workspaces.nvim",
      --   lazy = false,
      --   opts = {
      --     auto_open = true,
      --     auto_dir = true,
      --     hooks = {
      --       open = { "Telescope oldfiles" },
      --     },
      --   },
      -- },
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    opts = {
      pickers = {
        find_files = {
          no_ignore = true,
        },
        live_grep = {},
      },
      extensions = { "workspaces", "live_grep_args" },
    },
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
        git_ignored = false,
      },
      update_focused_file = {
        update_root = true,
      },
    },
  },
  {
    "ojroques/nvim-bufdel",
    lazy = false,
  },
  -- {
  --   "VonHeikemen/searchbox.nvim",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --   },
  -- },
}
