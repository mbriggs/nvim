-- 4 spaces by default
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- more sophisticated indentation
vim.opt.smartindent = true

-- soft wrapping long lines
vim.opt.wrap = true

vim.opt.number = true -- show line numbers

-- make extra files less irritating
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undo"
vim.opt.undofile = true

-- more gui colors
vim.opt.termguicolors = true

vim.opt.scrolloff = 8         -- lines to keep above / below the cursor
vim.opt.signcolumn = "yes"    -- show signs

vim.opt.isfname:append("@-@") -- allow @ in file names

vim.opt.updatetime = 50       -- speed up ui

vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
