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
                c = { name = "+code" },
                f = { name = "+find" },
                g = { name = "+git" },
            },
        })
    end,
}
