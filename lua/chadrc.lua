---@type ChadrcConfig
---@class Config
local M = {}

M.base46 = {
  theme = "catppuccin",
  hl_add = {
    DropBarMenuCurrentContext = {
      bg = "black2",
      fg = "white",
      bold = true,
    },
    DropBarMenuHoverEntry = {
      bg = "purple",
      fg = "black",
    },
    DropBarIconUIIndicator = {
      fg = "gray",
    },
  },
  changed_themes = {
    catppuccin = {
      base_16 = {
        base00 = "#181825",
      },
    },
  },
  integrations = { "dap" },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "  ▀▄   ▄▀      ▄▄▄████▄▄▄ ",
    " ▄█▀███▀█▄    ███▀▀██▀▀███",
    "█▀███████▀█   ▀▀███▀▀███▀▀",
    "▀ ▀▄▄ ▄▄▀ ▀    ▀█▄ ▀▀ ▄█▀ ",
    "",
  },
}

M.ui = {
  cmp = {
    style = "flat_dark",
    icons_left = true,
  },
  statusline = {
    separator_style = "block",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cursor", "cwd", "name" },
    modules = {
      name = function()
        return "%#StText# 👻 " .. "necronqwq "
      end,
    },
  },
  tabufline = {
    order = { "treeOffset", "buffers", "tabs" },
  },
}

M.lsp = {
  signature = true,
}

return M
