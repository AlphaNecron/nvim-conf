require "nvchad.options"
require "configs.neovide"

local o = vim.o
o.cursorlineopt = "both"
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"

vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/snippets"
