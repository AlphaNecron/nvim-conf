local M = {}

M.adapter = {
  type = "server",
  port = "${port}",
  executable = {
    command = "/usr/bin/codelldb",
    args = { "--port", "${port}" },
  },
}

M.config = {
  {
    name = "Launch file",
    type = "lldb",
    request = "launch",
    program = function()
      return require("cptest").get_exec_command()
      -- return "/tmp/build/" .. vim.fn.expand "%:t:r"
      -- return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  },
}

return M
