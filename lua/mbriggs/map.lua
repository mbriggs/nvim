vim.g.mapleader = " "
local map = vim.keymap.set

-- netrw
map("n", "<leader>pv", vim.cmd.Ex)

-- make it super easy to quit
map("n", "<leader><cr>", ":q<cr>")

-- make it super easy to split
map("n", "<leader>'", ":vsp<cr>")
map("n", '<leader>"', ":sp<cr>")

-- in visual mode, move lines around with J and K
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")

-- dont move the cursor when joining lines
map("n", "J", "mzJ`z")

-- keep cursor in middle of screen when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- keep cursor in the middle of the screen when moving between search results
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- emacs style cursor movement
map("i", "<C-e>", "<esc>A")
map("i", "<C-n>", "<down>")
map("i", "<C-p>", "<up>")
map("i", "<M-left>", "<C-left>")
map("i", "<M-right>", "<C-right>")
map("i", "<M-backspace>", "<C-w>")

-- dabbrev style completion
map("i", "<C-j>", "<C-x><C-n>")
map("i", "<C-k>", "<C-x><C-p>")

-- without yanking
map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>d", [["_d]])

-- yank to system
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- Q is the worst possible thing
map("n", "Q", "<nop>")

-- qf nav
map("n", "<M-n>", "<cmd>cnext<CR>zz")
map("n", "<M-p>", "<cmd>cprev<CR>zz")
map("n", "<M-q>", "<cmd>cclose<CR>")

-- substitute current word
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- save and clear highlights
map("n", "<CR>", ":nohlsearch<CR>:w<CR>")

-- H / L for start / end of line
map("n", "<s-h>", "^")
map("n", "<s-l>", "$")

-- put current dir into command
map("c", "%%", "<C-R>=expand('%:h').'/'<cr>")

-- go to previous buffer
map("n", "-", "<c-^>")

--tmux
map("n", "<c-w>h", function()
	require("tmux").move_left()
end)
map("n", "<c-w>j", function()
	require("tmux").move_bottom()
end)
map("n", "<c-w>k", function()
	require("tmux").move_top()
end)
map("n", "<c-w>l", function()
	require("tmux").move_right()
end)
