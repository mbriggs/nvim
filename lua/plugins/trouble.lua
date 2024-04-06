return {
    "folke/trouble.nvim",
    branch = "dev",
    init = function()     -- this shouldnt be necessary, lazy is not loading on these keymaps
        require("trouble").setup({})
    end,
    keys = {
        { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics (Trouble)" },
        { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
        { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",      desc = "Symbols (Trouble)" },
        {
            "<leader>cS",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP references/definitions/... (Trouble)",
        },
        { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
        { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",  desc = "Quickfix List (Trouble)" },
    },
}
