return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        local wk = require("which-key")

        wk.setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        })

        wk.register({
            ["<leader>"] = {
                b = { name = "+buffer" },
                p = { name = "+project" },
                d = { name = "+debug" },
                q = { name = "+diagnostics" },
                o = { name = "+neorg", j = { name = "+journal" } },
                c = { name = "+code" },
                t = { name = "+test" },
                f = { name = "+find" },
                g = { name = "+git" },
            },
        })

        local function LocalKeybinds()
            local wkl = require("which-key")
            local fileTy = vim.api.nvim_buf_get_option(0, "filetype")
            local opts = { prefix = "<LocalLeader>", buffer = 0 }

            if fileTy == "norg" then
                wkl.register({
                    o = {
                        t = { name = "+task" },
                        n = { name = "+note" },
                        l = { name = "+list" },
                        i = { name = "+insert" },
                        m = { name = "+mode" },
                    },
                }, opts)
            elseif fileTy == "sh" then
            end
        end
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            group = "userft",
            callback = LocalKeybinds,
        })
    end,
}
