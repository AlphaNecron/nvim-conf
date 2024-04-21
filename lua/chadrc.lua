---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  cmp = {
    style = "atom_colored",
  },
  nvdash = {
    load_on_startup = true,
    header = {
      "  ▀▄   ▄▀      ▄▄▄████▄▄▄ ",
      " ▄█▀███▀█▄    ███▀▀██▀▀███",
      "█▀███████▀█   ▀▀███▀▀███▀▀",
      "▀ ▀▄▄ ▄▄▀ ▀    ▀█▄ ▀▀ ▄█▀ ",
    },
  },
  statusline = {
    theme = "vscode_colored",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cursor", "cwd", "name" },
    modules = {
      name = function()
        return "%#StText#👻 " .. "necronqwq"
      end,
    },
  },
  tabufline = {
    order = { "treeOffset", "buffers", "tabs" },
  },
  transparency = true,
}

return M
