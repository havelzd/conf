return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>fe", ":Neotree filesystem reveal focus left<CR>", {})
		vim.keymap.set("n", "<leader>t", ":Neotree filesystem toggle left<CR>", {})
        vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
        vim.keymap.set("n", "<leader>gs", ":Neotree float git_status<CR>", {})
	end,
}
