-- skidded from https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/cosmicink.lua#L256-L276 :nerd:
local modes = {
  n = "N", -- Normal mode
  i = "I", -- Insert mode
  v = "V", -- Visual mode
  [""] = "V/B", -- Visual block mode
  V = "V/L", -- Visual line mode
  c = "C", -- Command-line mode
  no = "N/I", -- NInsert mode
  s = "S", -- Select mode
  S = "S/L", -- Select line mode
  ic = "I/C", -- Insert mode (completion)
  R = "R", -- Replace mode
  Rv = "V/R", -- Virtual Replace mode
  cv = "C", -- Command-line mode
  ce = "C", -- Ex mode
  r = "R", -- Prompt mode
  rm = "M", -- More mode
  ["r?"] = "?", -- Confirm mode
  ["!"] = "!", -- Shell mode
  t = "T", -- Terminal mode
}

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = { section_separators = "", component_separators = "" },
    sections = {
      lualine_a = {
        function()
          return modes[vim.fn.mode()] or "#"
        end,
      },
      lualine_z = {
        function()
          return os.getenv("USER") .. "@" .. vim.fn.hostname()
        end,
      },
    },
  },
}
