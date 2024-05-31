return {
  "knubie/vim-kitty-navigator",
  event = "VeryLazy",
  build = "cp ./*.py ~/.config/kitty/",
  init = function()
    vim.g.kitty_navigator_no_mappings = 1
  end,
  config = function()
    local map = vim.keymap.set

    map("", "<D-h>", ":KittyNavigateLeft<cr>", { desc = "kitty navigate left" })
    map("", "<D-j>", ":KittyNavigateDown<cr>", { desc = "kitty navigate down" })
    map("", "<D-k>", ":KittyNavigateUp<cr>", { desc = "kitty navigate up" })
    map("", "<D-l>", ":KittyNavigateRight<cr>", { desc = "kitty navigate right" })
  end,
}
