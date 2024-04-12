return {
    -- Mason manager
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    -- mason lsp
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function ()
            local lspconfig = require("lspconfig")
            local cmp_lsp = require('cmp_nvim_lsp')
            local capabilities = cmp_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

            lspconfig.lua_ls.setup({capabilities = capabilities})

            lspconfig.html.setup({capabilities = capabilities})
            lspconfig.cssls.setup({capabilities = capabilities})
            lspconfig.tsserver.setup({capabilities = capabilities})

            lspconfig.pylsp.setup({capabilities = capabilities})

            -- keymaps
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },
}
