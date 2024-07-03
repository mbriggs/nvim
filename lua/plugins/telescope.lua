return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"joaomsa/telescope-orgmode.nvim",
		"natecraddock/telescope-zf-native.nvim",
		"mbriggs/dir-telescope.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	cmd = { "Telescope" },
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		local lga_actions = require("telescope-live-grep-args.actions")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
			},
			extensions = {
				["zf-native"] = {
					file = {
						enable = true,
						highlight_results = true,
						match_filename = true,
					},

					generic = {
						enable = true,
						highlight_results = true,
						match_filename = false,
					},
				},

				live_grep_args = {
					auto_quoting = true, -- enable/disable auto-quoting
					-- define mappings, e.g.
					mappings = { -- extend mappings
						i = {
							["<C-k>"] = lga_actions.quote_prompt(),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
							-- freeze the current list and start a fuzzy search in the frozen list
							["<C-space>"] = actions.to_fuzzy_refine,
						},
					},
					-- ... also accepts theme settings, for example:
					-- theme = "dropdown", -- use dropdown theme
					-- theme = { }, -- use own theme spec
					-- layout_config = { mirror=true }, -- mirror preview pane
				},
			},
		})

		telescope.load_extension("live_grep_args")

		-- dir-telescope allows narrowing telescope to a specific directory
		require("dir-telescope").setup()
		telescope.load_extension("dir")

		telescope.load_extension("zf-native")
		-- telescope.load_extension("orgmode")

		-- vim.keymap.set("n", "<leader>;", telescope.find_files, { desc = "Find files" })
		-- vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
		-- vim.keymap.set("n", "<leader>fw", function()
		--     local word = vim.fn.expand("<cword>")
		--     telescope.grep_string({ search = word })
		-- end, { desc = "Find word" })
		-- vim.keymap.set("n", "<leader>fW", function()
		--     local word = vim.fn.expand("<cWORD>")
		--     telescope.grep_string({ search = word })
		-- end, { desc = "Find WORD" })
		-- vim.keymap.set("n", "<leader>fg", function()
		--     telescope.grep_string({ search = vim.fn.input("Grep > ") })
		-- end, { desc = "Grep" })
		-- vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Find help tag" })
		--
		-- vim.keymap.set("n", "<leader>=", telescope.lsp_document_symbols, { desc = "Document symbols" })
	end,
	keys = {
		{
			"<leader>f;",
			":Telescope resume<CR>",
			noremap = true,
			silent = true,
			desc = "Resume last telescope session",
		},
		-- find files
		{
			"<leader>;",
			":Telescope find_files<CR>",
			noremap = true,
			silent = true,
			desc = "Find files",
		},
		{
			"<leader>ff",
			":Telescope find_files<CR>",
			noremap = true,
			silent = true,
			desc = "Find files",
		},
		{
			"<leader>f<leader>f",
			":Telescope dir find_files<CR>",
			noremap = true,
			silent = true,
			desc = "Find files in subdir",
		},

		-- find current word
		{
			"<leader>fw",
			":lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<CR>",
			noremap = true,
			silent = true,
			desc = "Find current word in project",
		},
		{
			"<leader>fW",
			":lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor_current_buffer()<CR>",
			noremap = true,
			silent = true,
			desc = "Find current word in the current buffer",
		},

		-- find visual selection
		{
			"<leader>fv",
			":lua require('telescope-live-grep-args.shortcuts').grep_visual_selection()<CR>",
			noremap = true,
			silent = true,
			desc = "Find visual selection in project",
		},
		{
			"<leader>fV",
			":lua require('telescope-live-grep-args.shortcuts').grep_visual_selection_current_buffer()<CR>",
			noremap = true,
			silent = true,
			desc = "Find visual selection in the current buffer",
		},

		-- grep
		{
			"<leader>fg",
			":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
			noremap = true,
			silent = true,
			desc = "Grep",
		},
		{
			"<leader>f<leader>g",
			"<cmd>Telescope dir live_grep<CR>",
			noremap = true,
			silent = true,
			desc = "Grep in subdir",
		},

		-- vim
		{
			"<leader>fh",
			":Telescope help_tags<CR>",
			noremap = true,
			silent = true,
			desc = "Find help tag",
		},

		-- lsp
		{
			"<leader>=",
			":Telescope lsp_document_symbols<CR>",
			noremap = true,
			silent = true,
			desc = "Document symbols",
		},
	},
}
