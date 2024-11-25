-- not a flawless implementation but still usable xd

local inp_buf, out_buf, inp_win, out_win, t_id

local function get_term_win(id)
  for _, v in pairs(vim.g.nvchad_terms or {}) do
    if v.id == id then
      return v.win
    end
  end
end

local function is_win_valid(id, buf)
  return type(id) == "number"
    and vim.api.nvim_win_is_valid(id)
    and (buf == -1 and true or vim.api.nvim_buf_is_loaded(buf))
end

local function on_resize()
  local t = get_term_win "code_runner"
  local h = vim.o.lines
  local w = vim.o.columns
  if not is_win_valid(t, -1) then
    return
  end
  local term_h = math.floor(h * 4 / 10)
  vim.api.nvim_win_set_config(t, {
    width = math.floor(w / 2),
    height = term_h,
  })
  pcall(vim.api.nvim_win_set_config, inp_win, {
    height = math.floor(term_h / 2),
  })
  pcall(vim.api.nvim_win_set_config, out_win, {
    height = math.ceil(term_h / 2),
  })
end

vim.api.nvim_create_autocmd("VimResized", {
  callback = on_resize,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(e)
    vim.cmd.checktime()
  end,
})

vim.api.nvim_create_autocmd("WinClosed", {
  callback = function(e)
    if tonumber(e.match) == t_id and inp_buf ~= nil and inp_win ~= nil and out_buf ~= nil and out_win ~= nil then
      vim.api.nvim_buf_delete(inp_buf, {
        force = true,
        unload = true,
      })
      vim.api.nvim_buf_delete(out_buf, {
        force = true,
        unload = true,
      })
      inp_buf = nil
      inp_win = nil
      out_buf = nil
      out_win = nil
    end
  end,
})

vim.keymap.set("n", "<leader>cr", function()
  local cmd = require("cptest").get_command()
  if cmd ~= nil then
    os.execute "touch /tmp/input /tmp/output"
    local function open_buf(cbuf, cwin, f, w_opts)
      if type(cbuf) ~= "number" or not vim.api.nvim_buf_is_loaded(cbuf) then
        cbuf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_call(cbuf, function()
          vim.cmd.edit(f)
          vim.api.nvim_set_option_value("buflisted", false, {
            buf = cbuf,
          })
        end)
      end
      if not is_win_valid(cwin, -1) then
        cwin = vim.api.nvim_open_win(cbuf, false, w_opts)
      end
      return cbuf, cwin
    end
    require("nvchad.term").runner {
      id = "code_runner",
      cmd = cmd,
      pos = "bo sp",
    }
    t_id = get_term_win "code_runner"
    inp_buf, inp_win = open_buf(inp_buf, inp_win, "/tmp/input", {
      win = get_term_win "code_runner",
      split = "right",
    })
    out_buf, out_win = open_buf(out_buf, out_win, "/tmp/output", {
      win = inp_win,
      split = "below",
    })
    on_resize()
  end
end, {
  desc = "Run current file",
})
