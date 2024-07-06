return {
    { "rose-pine/neovim", name = "rose-pine",
        lazy = false,
        priority = 1000,
        opts = {

            styles = {
                bold = false,
                italic = false,
                transparency = false,
            },
        },
        init = function()
            vim.cmd.colorscheme("rose-pine") -- my favorite
        end
    },
    {
        "slugbyte/lackluster.nvim",
        lazy = false,
        init = function()
            --vim.cmd.colorscheme("lackluster")
            --vim.cmd.colorscheme("lackluster-hack") -- my favorite
            -- vim.cmd.colorscheme("lackluster-mint")
        end,
    },
}
