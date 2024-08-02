return {
	"rbong/vim-flog",
	lazy = true,
	cmd = { "Flog", "Flogsplit", "Floggit" },
	dependencies = {
		"tpope/vim-fugitive",
	},
	keys = {
		{ "<leader>gr", "<cmd>Flog<cr>", desc = "Explore branches" },
	},
}
