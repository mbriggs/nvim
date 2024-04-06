return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

            local mbfugitive = vim.api.nvim_create_augroup("mb_fugitive", {})

            local autocmd = vim.api.nvim_create_autocmd
            autocmd("BufWinEnter", {
                group = mbfugitive,
                pattern = "*",
                callback = function()
                    if vim.bo.ft ~= "fugitive" then
                        return
                    end

                    local bufnr = vim.api.nvim_get_current_buf()

                    local opts = { buffer = bufnr, remap = false }
                    vim.keymap.set("n", "<leader>p", function()
                        vim.cmd.Git("push")
                    end, opts)

                    -- rebase always
                    vim.keymap.set("n", "<leader>P", function()
                        vim.cmd.Git({ "pull", "--rebase" })
                    end, opts)

                    -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                    -- needed if i did not set the branch up correctly
                    vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)

                    -- q quits
                    vim.keymap.set("n", "q", ":q<CR>", opts)
                end,
            })
        end,
    },

    {
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
            -- mapping to call url generation
            mappings = "<leader>gy",
        },
        requires = "nvim-lua/plenary.nvim",
    },
}
