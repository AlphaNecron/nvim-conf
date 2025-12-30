return {
  "stevearc/overseer.nvim",
  init = function()
    vim.schedule(function()
      Snacks.toggle({
        name = "Overseer",
        get = function()
          return require("overseer.window").is_open()
        end,
        set = function(state)
          local w = require("overseer.window")
          if state then
            w.open()
          else
            w.close()
          end
        end,
      }):map("<leader>ot")
    end)
  end,
  keys = function()
    return {
      { "<leader>oo", "<cmd>OverseerRun<cr>", desc = "Run task" },
      { "<leader>oa", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
      { "<leader>os", "<cmd>OverseerShell<cr>", desc = "Shell command" },
    }
  end,
}
