function ColorMyPencils(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

end

return {
    {
        "rose-pine/neovim",
        lazy = false,
        priority = 1000,
        config = function()
            require('rose-pine').setup({
                style = { italic = false, transparency = true, },
            })
            vim.cmd([[colorscheme rose-pine]])
            ColorMyPencils()
        end,
    },
    {
        "nyoom-engineering/oxocarbon.nvim",
    },
}
