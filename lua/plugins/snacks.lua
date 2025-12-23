return {
  "folke/snacks.nvim",
  opts = {
    input = {
      border = "single",
    },
    notifier = {
      style = function(buf, notif, ctx)
        ctx.opts.border = "right"
        local whl = ctx.opts.wo.winhighlight
        ctx.opts.wo.winhighlight = whl:gsub(ctx.hl.msg, "SnacksNotifierMinimal")
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(notif.msg, "\n"))
        vim.api.nvim_buf_set_extmark(buf, ctx.ns, 0, 0, {
          virt_text = { { notif.icon .. " ", ctx.hl.icon } },
          virt_text_pos = "inline",
        })
      end,
    },
  },
}
