return {
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

        vim.keymap.set("n", "<leader>;", telescope.find_files, { desc = "Find files" })
        vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
        vim.keymap.set("n", "<leader>fw", function()
            local word = vim.fn.expand("<cword>")
            telescope.grep_string({ search = word })
        end, { desc = "Find word" })
        vim.keymap.set("n", "<leader>fW", function()
            local word = vim.fn.expand("<cWORD>")
            telescope.grep_string({ search = word })
        end, { desc = "Find WORD" })
        vim.keymap.set("n", "<leader>fg", function()
            telescope.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Grep" })
        vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Find help tag" })

        vim.keymap.set("n", "<leader>=", telescope.lsp_document_symbols, { desc = "Document symbols" })
    end,
}
