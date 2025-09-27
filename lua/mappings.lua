require "nvchad.mappings"
require "code_runner"

local map = vim.keymap.set
local unmap = vim.keymap.del

unmap("n", "<leader>th")
unmap("n", "<leader>ch")
unmap("n", "<leader>wk")
unmap("n", "<leader>wK")
unmap("n", "<leader>pt")

map("n", ";", ":", {
  desc = "CMD enter command mode",
})
map("i", "jk", "<ESC>")

map("n", "<leader>cd", function()
  local dap = require "dap"
  if dap.session() == nil then
    dap.continue()
  else
    dap.terminate()
  end
end, {
  desc = "Debugger toggle session",
})

map("n", "<leader>dr", function()
  require("dap").restart()
end, {
  desc = "Debugger restart session",
})

map("n", "<leader>d<space>", function()
  require("dap").toggle_breakpoint()
end, {
  desc = "Debugger toggle breakpoint",
})
map("n", "<leader>dd", function()
  require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, {
  desc = "Debugger set conditional breakpoint",
})

map("n", "<leader>g", function()
  require("menu").open(require "configs.menu.default")
end, {})

map("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or require "configs.menu.default"
  require("menu").open(options, {
    mouse = true,
  })
end, {})

map("n", "<C-/>", "gbc", { desc = "toggle block comment", remap = true })
map("v", "<C-/>", "gb", { desc = "toggle block comment", remap = true })
