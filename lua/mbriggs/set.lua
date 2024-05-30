-- 2 spaces by default
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- more sophisticated indentation
vim.opt.smartindent = true

-- conceal links in org mode
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'

-- soft wrapping long lines
vim.opt.wrap = true

vim.opt.number = true -- show line numbers

-- make extra files less irritating
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undo"
vim.opt.undofile = true

-- folding
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99

-- more gui colors
vim.opt.termguicolors = true

vim.opt.scrolloff = 8         -- lines to keep above / below the cursor
vim.opt.signcolumn = "yes"    -- show signs

vim.opt.isfname:append("@-@") -- allow @ in file names

vim.opt.updatetime = 50       -- speed up ui

vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
