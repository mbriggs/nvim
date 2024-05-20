return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        kind = "auto",
    },
    cmd = { "Neogit" },
    keys = {
        { "<leader>gg", "<cmd>Neogit<CR>", desc = "Neogit" },
    },
}
