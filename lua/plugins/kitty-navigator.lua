return {
	"knubie/vim-kitty-navigator",
	event = "VeryLazy",
	build = "cp ./*.py ~/.config/kitty/",
	init = function()
		vim.g.kitty_navigator_no_mappings = 1
	end,
	config = function()
		local map = vim.keymap.set
		local modes = { "n", "v" }

		map(modes, "<D-h>", ":KittyNavigateLeft<cr>", { desc = "kitty navigate left" })
		map(modes, "<D-j>", ":KittyNavigateDown<cr>", { desc = "kitty navigate down" })
		map(modes, "<D-k>", ":KittyNavigateUp<cr>", { desc = "kitty navigate up" })
		map(modes, "<D-l>", ":KittyNavigateRight<cr>", { desc = "kitty navigate right" })

		map("i", "<D-h>", "<c-o>:KittyNavigateLeft<cr>", { desc = "kitty navigate left" })
		map("i", "<D-j>", "<c-o>:KittyNavigateDown<cr>", { desc = "kitty navigate down" })
		map("i", "<D-k>", "<c-o>:KittyNavigateUp<cr>", { desc = "kitty navigate up" })
		map("i", "<D-l>", "<c-o>:KittyNavigateRight<cr>", { desc = "kitty navigate right" })
	end,
}
