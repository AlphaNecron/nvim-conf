require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>cr", function()
  require("nvchad.term").runner {
    id = function()
      return vim.fn.expand "%"
    end,
    pos = "sp",
    cmd = function()
      return require("code_runner.commands").get_filetype_command()
    end,
  }
end, { desc = "Run current file" })
