return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require "configs.conform"
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            {
                "LiadOz/nvim-dap-repl-highlights",
                config = true,
            },
            {
                "nvim-treesitter/nvim-treesitter-context",
                config = true,
            },
        },
        opts = {
            ensure_installed = {
                "python",
                "vim",
                "vimdoc",
                "cpp",
            },
        },
    },
    {
        "williamboman/mason.nvim",
        opts = {
            PATH = "append",
            ensure_installed = {
                "clangd",
                "gopls",
                "basedpyright",
                "clang-format"
            },
        },
    },
}
