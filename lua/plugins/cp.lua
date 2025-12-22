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
    keys = {
      { "<leader>tc", "<cmd>CompetiTest run<cr>", desc = "Run" },
      { "<leader>ta", "<cmd>CompetiTest add_testcase<cr>", desc = "Add testcase" },
      { "<leader>te", "<cmd>CompetiTest edit_testcase<cr>", desc = "Edit testcase" },
      { "<leader>td", "<cmd>CompetiTest delete_testcase<cr>", desc = "Delete testcase" },
    },
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
