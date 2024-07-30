return {
	"dmtrKovalenko/caps-word.nvim",
	config = true,
	keys = {
		{
			mode = { "i", "n" },
			"<C-s>",
			"<cmd>lua require('caps-word').toggle()<CR>",
		},
	},
}
