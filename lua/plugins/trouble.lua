return {
    "folke/trouble.nvim",
    branch = "dev",
    init = function() -- this shouldnt be necessary, lazy is not loading on these keymaps
        require("trouble").setup({})
    end,
    keys = {
        { "<leader>qq", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics (Trouble)" },
        { "<leader>qb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
    },
}
