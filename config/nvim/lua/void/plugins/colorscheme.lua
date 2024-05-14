function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end

return {

    "nyoom-engineering/oxocarbon.nvim",

    {
        "rose-pine/neovim",
        priority = 1000,
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                style = { italic = false, },
            })

            vim.cmd("colorscheme rose-pine")
            ColorMyPencils()
        end,
    }
}
