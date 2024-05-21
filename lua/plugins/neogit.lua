return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		kind = "auto",
		auto_show_console = false,
	},
	cmd = { "Neogit" },
	keys = {
		{ "<leader>gg", "<cmd>Neogit<CR>", desc = "Neogit" },
	},
}
