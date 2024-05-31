-- hide header
vim.g.netrw_banner = 0

-- Show directories first (sorting)
vim.g.netrw_sort_sequence = [[[\/]$,*]]

-- Human-readable files sizes
vim.g.netrw_sizestyle = "H"

-- Setup file operations commands (enable recursive copy and remove)
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_localmkdir = "mkdir -p"
vim.g.netrw_localrmdir = "rm -r"

-- split to the right instead of the left
vim.g.netrw_altv = 1

-- Highlight marked files in the same way search matches are
vim.cmd("hi! link netrwMarkFile Search")

vim.keymap.set("n", "<leader>x", vim.cmd.Ex, { desc = "netrw" })
