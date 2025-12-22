local lazy_pick = function(t)
  return "<cmd> lua LazyVim.pick(" .. (t == nil and "" or ('"' .. t .. '"')) .. ")() <cr>"
end

return {
  {
    "goolord/alpha-nvim",
    opts = function(_, dashboard)
      local logo = [[
  ▀▄   ▄▀      ▄▄▄████▄▄▄
 ▄█▀███▀█▄    ███▀▀██▀▀███
█▀███████▀█   ▀▀███▀▀███▀▀
▀ ▀▄▄ ▄▄▀ ▀    ▀█▄ ▀▀ ▄█▀
]]
      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("p", " " .. " Projects", lazy_pick("projects")),
        dashboard.button("f", " " .. " Find file", lazy_pick(nil)),
        dashboard.button("n", " " .. " New file", [[<cmd> ene <BAR> startinsert <cr>]]),
        dashboard.button("r", " " .. " Recent files", lazy_pick("oldfiles")),
        dashboard.button("g", " " .. " Find text", lazy_pick("live_grep")),
        -- dashboard.button("c", " " .. " Config",          "<cmd> lua LazyVim.pick.config_files()() <cr>"),
        dashboard.button("s", " " .. " Restore", [[<cmd> lua require("persistence").load() <cr>]]),
        -- dashboard.button("x", " " .. " Lazy Extras",     "<cmd> LazyExtras <cr>"),
        -- dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
        dashboard.button("l", " " .. " Leet", "<cmd>Leet<cr>"),
        dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      return dashboard
    end,
  },
}
