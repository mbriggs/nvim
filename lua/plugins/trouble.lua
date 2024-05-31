return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	config = true,
	keys = {
		{ "<leader>qq", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
		{ "<leader>qb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
	},
}
