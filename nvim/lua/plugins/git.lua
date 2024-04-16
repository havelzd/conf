return {
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("lazygit")
            vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", {})
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local gitsigns = require("gitsigns")
            gitsigns.setup()
            vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk)
            vim.keymap.set("n", "<leader>hd", gitsigns.diffthis)
            vim.keymap.set("n", "<leader>hb", function()
                gitsigns.blame_line({ full = true })
            end)
            vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame)
        end,
    },
}
