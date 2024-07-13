return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",           -- source for text in buffer
            "hrsh7th/cmp-path",             -- source for file system paths
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",             -- snippet engine
            "saadparwaiz1/cmp_luasnip",     -- for autocompletion
            "rafamadriz/friendly-snippets", -- useful snippets
        },
        opts = {
             kind_icons = {
                Text = "",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰇽",
                Variable = "󰂡",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "󰅲",
            }
        },
        config = function(_, opts)

            local cmp = require("cmp")
            local luasnip = require("luasnip")

            -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                completion = {
                    completeopt = "menu,menuone,preview,select",
                },
                snippet = { -- configure how nvim-cmp interacts with snippet engine
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                formatting = {
                    fields = { 'kind', 'abbr', 'menu' },
                    format = function(_, vim_item )

                        vim_item.kind = opts.kind_icons[vim_item.kind]
                        local m = vim_item.menu and vim_item.menu or ""
                        if #m > 20 then
                            vim_item.menu = string.sub(m, 1, 30) .. "..."
                        end
                        return vim_item
                    end,
                },

                window = {
                    completion = { border = "single", col_offset = -3, side_padding = 0, scrollbar = false },
                    documentation = { border = "single" },
                },
                matching = {
                    disallow_fuzzy_matching = false,
                    disallow_partial_matching = true,
                    disallow_prefix_unmatching = false,
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                    ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),

                -- sources for autocompletion
                sources = cmp.config.sources({
                    { name = "luasnip" }, -- snippets
                    { name = "nvim_lsp" },
                    { name = "buffer" },  -- text within current buffer
                    { name = "path" },    -- file system paths
                }),
            })
        end,
    },
}
