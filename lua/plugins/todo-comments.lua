local function alt(...)
  local t = {}
  for _, v in ipairs({ ... }) do
    table.insert(t, "[" .. v .. "]")
    table.insert(t, "[" .. v:upper() .. "]")
  end
  return { alt = t }
end

return {
  "folke/todo-comments.nvim",
  opts = {
    highlight = { keyword = "fg" },
    keywords = {
      TODO = alt("todo"),
      FIX = alt("fix", "fixme"),
      HACK = alt("hack"),
      WARN = alt("warn", "warning", "error", "fatal"),
      NOTE = alt("note", "info"),
      TEST = alt("trace", "debug"),
      PERF = alt("mark"),
    },
  },
  config = function(_, opts)
    require("todo-comments").setup(opts)
    local cfg, r, b, m = require("todo-comments.config"), {}, {}, {}
    for kw, p in pairs(cfg.keywords) do
      local e = vim.fn.escape(kw, "[]\\^$.*~")
      if kw:match("^%[") then table.insert(b, e) else
        table.insert(r, e)
        local g, hl = "TodoBg" .. p, vim.api.nvim_get_hl(0, { name = "TodoBg" .. p })
        vim.api.nvim_set_hl(0, g .. "Wide", { bg = hl.bg, fg = hl.bg })
        table.insert(m, { kw, g })
      end
    end
    cfg.hl_regex = { [[.*<(]] .. table.concat(r, "|") .. [[)\s*:]], [[.*(]] .. table.concat(b, "|") .. [[)]] }
    vim.api.nvim_create_autocmd("BufWinEnter", {
      callback = function()
        for _, x in ipairs(m) do
          vim.fn.matchadd(x[2], [[.\<]] .. x[1] .. [[\>]])
          vim.fn.matchadd(x[2] .. "Wide", x[1] .. [[\>\zs:\ze]])
        end
      end,
    })
  end,
}
