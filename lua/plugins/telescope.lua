return {
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
}
