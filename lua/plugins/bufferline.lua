local function greet()
  local hr = tonumber(os.date("%H"))
  if hr >= 5 and hr < 12 then
    return "gud mornin"
  elseif hr >= 12 and hr < 17 then
    return "gud afternoon"
  elseif hr >= 17 and hr < 21 then
    return "gud evening"
  else
    return "~~night"
  end
end

return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      show_buffer_close_icons = false,
      offsets = {
        {
          filetype = "neo-tree",
          highlight = "UwU",
          text = greet() .. " 🌸",
          text_align = "right",
        },
        {
          filetype = "snacks_layout_box",
        },
      },
    },
  },
}
