-- return {}
return {
	"catppuccin/nvim",
	name = "catpuccin",
	lazy = false,
	priority = 1000,
	config = function()
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.opt.background = "light"
		vim.cmd.colorscheme("catppuccin-latte")
	end,
}
