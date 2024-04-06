return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
        local map = vim.keymap.set

        map("n", "<leader>a", function()
            harpoon:list():add()
        end, { noremap = true, silent = true, desc = "Add to Harpoon" })

        map("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        map("n", "<C-h>", function()
            harpoon:list():select(1)
        end)
        map("n", "<C-j>", function()
            harpoon:list():select(2)
        end)
        map("n", "<C-k>", function()
            harpoon:list():select(3)
        end)
        map("n", "<C-l>", function()
            harpoon:list():select(4)
        end)
    end,
}
