-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

-- local map = vim.api.nvim_set_keymap
--local opts = { noremap = true, silent = true}

--local builtin = require("telescope.builtin")
--vim.keymap.set("n", "<C-p>", builtin.find_files, {})
-- Telescope
--map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
--map('n', '<leader>fg', builtin.live_grep, opts)
--map('n', '<C-p>', '<cmd>Telescope git_files<CR>', opts)
--map('n', '<leader>ps', '<cmd>Telescope git_files<CR>', opts)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
