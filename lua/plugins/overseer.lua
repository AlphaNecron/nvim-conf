return {
  "stevearc/overseer.nvim",
  opts = {
    component_aliases = {
      default = {
        { "open_output", direction = "dock", on_start = "always" },
        "on_exit_set_status",
        "on_complete_notify",
        "on_complete_dispose",
      },
    },
  },
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
      {
        "<leader>oc",
        function()
          local tasks = require("overseer.task_list").list_tasks({ status = "FAILURE" })
          for _, t in ipairs(tasks) do
            t:dispose()
          end
        end,
        desc = "Clear failed tasks",
      },
    }
  end,
}
