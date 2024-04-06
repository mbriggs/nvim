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

        vim.keymap.set("n", "<leader>;", telescope.find_files, {})
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
}
