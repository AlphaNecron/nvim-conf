require "nvchad.options"

local o = vim.o
o.cursorlineopt = "both"

vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/snippets"
