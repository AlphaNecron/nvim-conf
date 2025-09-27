return {
  {
    "AlphaNecron/cptest.nvim",
    opts = {
      file_types = {
        cpp = {
          compile = function()
            return "mkdir -p /tmp/build && g++ -Wall -std=gnu++20 -DONLINE_JUDGE -march=native -fmax-errors=5 "
              .. vim.fn.expand "%:p"
              .. " -o /tmp/build/"
              .. vim.fn.expand "%:t:r"
          end,
          exec = function()
            return "timeout 1s /tmp/build/" .. vim.fn.expand "%:t:r" .. " < /tmp/input 2> /tmp/output"
          end,
        },
      },
    },
    -- dir = "/data/Dev/cptest.nvim",
    -- dev = true,
  },
}
