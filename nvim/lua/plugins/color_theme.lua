return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "frappe",
                transparent_background = true,
                integrations = {
                    treesitter = true,
                    telescope = true,
                    mason = true,
                    cmp = true,
                },
            })
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("tokyonight").setup({
                style = "storm",
            })
            -- vim.cmd.colorscheme("tokyonight")
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                -- disable_background = true,
                dark_variant = "moon",
                styles = {
                    italic = false,
                },
                enable = {
                    terminal = true,
                },
            })

            vim.cmd.colorscheme("rose-pine")
        end,
    },
}
