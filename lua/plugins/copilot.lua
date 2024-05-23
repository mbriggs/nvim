-- Github Copilot
-- Mappings are in alacritty config
-- cmd-; - accept
-- cmd-] - next
-- cmd-[ - prev
return {
	"zbirenbaum/copilot.lua",
	main = "copilot",
	event = "VeryLazy",
	config = function()
		require("copilot").setup({
			filetypes = {
				org = false,
			},
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<D-;>",
					accept_word = false,
					accept_line = false,
					next = "<D-]>",
					prev = "<D-[>",
					dismiss = "<C-]>",
				},
			},
			panel = {
				enabled = false,
			},
		})
		vim.cmd([[Copilot auth]])
	end,
}
