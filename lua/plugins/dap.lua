return {
  {
    "rcarriga/nvim-dap-ui",
    config = true,
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        config = true,
        dependencies = {
          "williamboman/mason.nvim",
          {
            "mfussenegger/nvim-dap",
            config = function()
              require "configs.dap"
            end,
          },
        },
      },
      "nvim-neotest/nvim-nio",
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = true,
    requires = { "mfussenegger/nvim-dap" },
  },
}
