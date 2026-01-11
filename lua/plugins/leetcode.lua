return {
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    cmd = "Leet",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "muniftanjim/nui.nvim",
    },
    opts = {
      lang = "python3",
      -- image_support = true,
      non_standalone = true,
      injector = {
        ["cpp"] = {
          before = {
            "#include <bits/stdc++.h>",
            "using namespace std;",
          },
          after = {
            "int main() {",
            "    Solution solution;",
            "    return 0;",
            "}",
          },
        },
      },
      hooks = {
        ["question_enter"] = {
          function(q)
            local bufnr = q.bufnr
            local winid = q.winid
            vim.wo[winid].foldmethod = "marker"
            vim.wo[winid].foldmarker = "@leet imports start,@leet imports end"
            vim.wo[winid].foldlevel = 0
            vim.wo[winid].foldenable = true
            local km = vim.keymap

            km.set("n", "<leader>ll", "<cmd>Leet list<cr>", { buffer = bufnr, desc = "LeetCode list" })
            km.set("n", "<leader>lr", "<cmd>Leet run<cr>", { buffer = bufnr, desc = "LeetCode run" })
            km.set("n", "<leader>ls", "<cmd>Leet submit<cr>", { buffer = bufnr, desc = "LeetCode submit" })
            km.set("n", "<leader>li", "<cmd>Leet info<cr>", { buffer = bufnr, desc = "LeetCode information" })
            km.set("n", "<leader>ld", "<cmd>Leet desc<cr>", { buffer = bufnr, desc = "LeetCode description" })
          end,
          function(q)
            local winid = q.description.winid

            vim.wo[winid].wrap = true
            vim.wo[winid].showbreak = "NONE"
            vim.wo[winid].smoothscroll = true
            vim.wo[winid].foldcolumn = "0"
          end,
        },
      },
    },
  },
  {
    "3rd/image.nvim",
    enabled = false,
    opts = {
      markdown = {
        filetypes = { "markdown", "leetcode.nvim" },
      },
    },
  },
}
