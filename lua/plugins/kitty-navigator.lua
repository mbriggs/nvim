return {
    "knubie/vim-kitty-navigator",
    event = "VeryLazy",
    build = "cp ./*.py ~/.config/kitty/",
    config = function()
        vim.g.kitty_navigator_no_mappings = 1
        local map = vim.keymap.set

        map("n", "<D-h>", ":KittyNavigateLeft<cr>", { desc = "kitty navigate left" })
        map("n", "<D-j>", ":KittyNavigateDown<cr>", { desc = "kitty navigate down" })
        map("n", "<D-k>", ":KittyNavigateUp<cr>", { desc = "kitty navigate up" })
        map("n", "<D-l>", ":KittyNavigateRight<cr>", { desc = "kitty navigate right" })
    end,
}
