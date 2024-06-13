return {
	"vim-test/vim-test",

	init = function()
		vim.g["test#strategy"] = "kitty"
	end,

	keys = {
		{ "<leader>tt", "<cmd>TestNearest<cr>", desc = "Test Nearest" },
		{ "<leader>tf", "<cmd>TestFile<cr>", desc = "Test Current File" },
		{ "<leader>ta", "<cmd>TestSuite<cr>", desc = "Test Whole Suite" },
		{ "<leader>tl", "<cmd>TestLast<cr>", desc = "Rerun last test" },
		{ "<leader>tg", "<cmd>TestVisit<cr>", desc = "Visit last test" },
	},
}
