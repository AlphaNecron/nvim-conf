return {
  {
    "xeluxee/competitest.nvim",
    dependencies = "muniftanjim/nui.nvim",
    cmd = "CompetiTest",
    opts = {
      compile_command = {
        cpp = { exec = "g++", args = { "-Wall", "$(FABSPATH)", "-o", "/tmp/$(FNOEXT)" } },
      },
      run_command = {
        cpp = { exec = "/tmp/$(FNOEXT)" },
      },
      view_output_diff = true,
      testcases_use_single_file = true,
      testcases_single_file_format = "$(FNOEXT).tests",
      split_ui = {
        position = "bottom",
        horizontal_layout = {
          { 3, { { 1, "tc" }, { 1, "se" } } },
          { 3, "si" },
          { 4, { { 1, "so" }, { 1, "eo" } } },
        },
      },
      runner_ui = {
        interface = "split",
      },
      floating_border_highlight = "NoiceCmdlinePopupBorder",
    },
    init = function(p)
      local keys = {}
      for k, v in pairs(vim.tbl_deep_extend("force", p.opts.compile_command, p.opts.run_command)) do
        keys[#keys + 1] = k
      end
      vim.api.nvim_create_autocmd("FileType", {
        pattern = keys,
        callback = function(ev)
          local km = vim.keymap

          km.set("n", "<leader>tc", "<cmd>CompetiTest run<cr>", { buffer = ev.buf, desc = "Run" })
          km.set("n", "<leader>ta", "<cmd>CompetiTest add_testcase<cr>", { buffer = ev.buf, desc = "Add testcase" })
          km.set("n", "<leader>te", "<cmd>CompetiTest edit_testcase<cr>", { buffer = ev.buf, desc = "Edit testcase" })
          km.set(
            "n",
            "<leader>td",
            "<cmd>CompetiTest delete_testcase<cr>",
            { buffer = ev.buf, desc = "Delete testcase" }
          )
        end,
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      nesting_rules = {
        ["cpp"] = {
          pattern = "(.*)%.cpp$",
          files = {
            "%1.tests",
          },
        },
        ["py"] = {
          pattern = "(.*)%.py$",
          files = {
            "%1.tests",
            "__pycache__",
          },
        },
      },
    },
  },
}
