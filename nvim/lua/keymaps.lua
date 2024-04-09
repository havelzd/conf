-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = ' '

-- local map = vim.api.nvim_set_keymap
--local opts = { noremap = true, silent = true}

--local builtin = require("telescope.builtin")
--vim.keymap.set("n", "<C-p>", builtin.find_files, {})
-- Telescope
--map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
--map('n', '<leader>fg', builtin.live_grep, opts)
--map('n', '<C-p>', '<cmd>Telescope git_files<CR>', opts)
--map('n', '<leader>ps', '<cmd>Telescope git_files<CR>', opts)
