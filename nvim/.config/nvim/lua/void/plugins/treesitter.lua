return {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    enabled = true,
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function ()
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
            highlight = {enable = true },
            indent = {enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn", -- set to `false` to disable one of the mappings
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
        })
    end,
}