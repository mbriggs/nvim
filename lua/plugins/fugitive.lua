return {
	"tpope/vim-fugitive",
	keys = {
		{ "<leader>gg", "<cmd>:Git<CR>", noremap = true, silent = true, desc = "Git status" },
		{ "<leader>gp", "<cmd>:Git push<CR>", noremap = true, silent = true, desc = "Push" },
		{ "<leader>gf", "<cmd>:Git pull --rebase<CR>", noremap = true, silent = true, desc = "Pull with rebase" },
		{ "<leader>gt", "<cmd>:Git push -u origin<CR>", noremap = true, silent = true, desc = "Push with tracking" },
	},
}
