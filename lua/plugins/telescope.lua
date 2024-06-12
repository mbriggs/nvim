return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"joaomsa/telescope-orgmode.nvim",
		"natecraddock/telescope-zf-native.nvim",
	},
	cmd = { "Telescope" },
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
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
			},
		})

		require("telescope").load_extension("zf-native")
		-- require("telescope").load_extension("orgmode")

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
			"<leader>fw",
			":lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })<CR>",
			noremap = true,
			silent = true,
			desc = "Find current word in project",
		},
		{
			"<leader>fW",
			":lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cWORD>') })<CR>",
			noremap = true,
			silent = true,
			desc = "Find current WORD (looser definition) in project",
		},
		{
			"<leader>fg",
			":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') })<CR>",
			noremap = true,
			silent = true,
			desc = "Grep",
		},
		{
			"<leader>fh",
			":Telescope help_tags<CR>",
			noremap = true,
			silent = true,
			desc = "Find help tag",
		},
		{
			"<leader>f;",
			":Telescope resume<CR>",
			noremap = true,
			silent = true,
			desc = "Resume last telescope session",
		},
		{
			"<leader>=",
			":Telescope lsp_document_symbols<CR>",
			noremap = true,
			silent = true,
			desc = "Document symbols",
		},
	},
}
