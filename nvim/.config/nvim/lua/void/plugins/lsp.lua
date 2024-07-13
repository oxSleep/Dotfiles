return {

    "neovim/nvim-lspconfig",
    opts = {
        underline = false,
        update_in_insert = false,
        virtual_text = false,
        severity_sort = true,
        inlay_hints = {
            enabled = true,
            exclude = {},     -- filetypes for which you don't want to enable inlay hints
        },
        -- Enable lsp cursor word highlighting
        document_highlight = {
            enabled = false,
        },
        -- add any global capabilities here
        capabilities = {
            workspace = {
                fileOperations = {
                    didRename = true,
                    willRename = true,
                },
            },
        },

        float = {
            focusable = false,
            style = "minimal",
            border = "single",
            source = "always",
            header = "",
            prefix = "",
        },
    },
    config = function(_, opts)
        local servers = { "lua_ls", "clangd", "glsl_analyzer" }
        local lspconfig = require("lspconfig")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())


        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
        require("lspconfig.ui.windows").default_options.border = "single"

        vim.diagnostic.config(opts)

        for _, server in pairs(servers) do
            local lsp_opts= {
                opts = opts,
                capabilities = capabilities,
            }
            lspconfig[server].setup(lsp_opts)
        end
    end
}
