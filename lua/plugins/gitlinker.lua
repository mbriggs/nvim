return {
	"ruifm/gitlinker.nvim",
	event = "BufRead",
	opts = {
		-- remote = 'github', -- force the use of a specific remote
		-- adds current line nr in the url for normal mode
		add_current_line_on_normal_mode = true,
		-- callback for what to do with the url
		action_callback = function(url)
			require("gitlinker.actions").copy_to_clipboard(url)
		end,
		-- print the url after performing the action
		print_url = false,
	},
	keys = {
		{
			"<leader>gy",
			[[<cmd>lua require("gitlinker").get_buf_range_url("n")]],
			desc = "Generate github link to current line",
		},
		{
			"<leader>gy",
			[[<cmd>lua require("gitlinker").get_buf_range_url("v")]],
			mode = "v",
			desc = "Generate github link to current line",
		},
	},
	requires = "nvim-lua/plenary.nvim",
}
