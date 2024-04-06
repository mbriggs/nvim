return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope.builtin")
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<esc>"] = actions.close,
						},
					},
				},
			})

			vim.keymap.set("n", "<leader>;", telescope.find_files, {})
			vim.keymap.set("n", "<C-p>", telescope.git_files, {})
			vim.keymap.set("n", "<leader>pws", function()
				local word = vim.fn.expand("<cword>")
				telescope.grep_string({ search = word })
			end)
			vim.keymap.set("n", "<leader>pWs", function()
				local word = vim.fn.expand("<cWORD>")
				telescope.grep_string({ search = word })
			end)
			vim.keymap.set("n", "<leader>ps", function()
				telescope.grep_string({ search = vim.fn.input("Grep > ") })
			end)
			vim.keymap.set("n", "<leader>vh", telescope.help_tags, {})
		end,
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		lazy = false,
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()
			local map = vim.keymap.set

			map("n", "<leader>a", function()
				harpoon:list():add()
			end)
			map("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			map("n", "<C-j>", function()
				harpoon:list():select(1)
			end)
			map("n", "<C-k>", function()
				harpoon:list():select(2)
			end)
			map("n", "<C-l>", function()
				harpoon:list():select(3)
			end)
			map("n", "<C-s>", function()
				harpoon:list():select(4)
			end)

			-- Toggle previous & next buffers stored within Harpoon list
			map("n", "<C-S-P>", function()
				harpoon:list():prev()
			end)
			map("n", "<C-S-N>", function()
				harpoon:list():next()
			end)
		end,
	},
}
