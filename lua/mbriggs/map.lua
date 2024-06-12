vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.keymap.set

-- nuke buffer
map("n", "<leader>bk", "<cmd>bd!<cr>", { desc = "nuke buffer" })

-- go to alternate file
map("n", "<leader>-", "<C-^>", { desc = "go to alternate file" })

-- make file executable
map("n", "<leader>bx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "make file executable" })

-- make it super easy to quit
map("n", "<leader><space>", ":q<cr>", { desc = "quit" })

-- make it super easy to split
map("n", "<leader>'", ":vsp<cr>", { desc = "vertical split" })
map("n", '<leader>"', ":sp<cr>", { desc = "horizontal split" })

-- in visual mode, move lines around with J and K
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "move line(s) down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "move line(s) up" })

-- dont move the cursor when joining lines
map("n", "J", "mzJ`z", { desc = "join lines" })

-- keep cursor in middle of screen when scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "scroll up" })

-- keep cursor in the middle of the screen when moving between search results
map("n", "n", "nzzzv", { desc = "next search result" })
map("n", "N", "Nzzzv", { desc = "previous search result" })

-- emacs style
map("n", "<leader>.", "<C-]>", { desc = "jump to definition" })
map("i", "<C-a>", "<Home>", { desc = "start of line" })
map("i", "<C-e>", "<esc>A", { desc = "end of line" })
map("i", "<C-n>", "<down>", { desc = "next line" })
map("i", "<C-p>", "<up>", { desc = "previous line" })
map("i", "<M-left>", "<C-left>", { desc = "previous word" })
map("i", "<M-right>", "<C-right>", { desc = "next word" })
map("i", "<M-backspace>", "<C-w>", { desc = "delete previous word" })

-- without yanking
map("x", "<leader>p", [["_dP]], { desc = "paste without yanking" })

-- yank to system
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "yank to system clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "yank rest of line to system clipboard" })

-- replay macro
map("n", "Q", "@q", { desc = "replay macro" })

-- qf nav, keep cursor in the middle of the screen, go off of option
map("n", "<C-S-n>", "<cmd>cnext<CR>zz", { desc = "next quickfix" })
map("n", "<C-S-p>", "<cmd>cprev<CR>zz", { desc = "previous quickfix" })

-- substitute current word
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "substitute current word" })

-- H / L for start / end of line
map({ "n", "v" }, "<s-h>", "^", { desc = "start of line" })
map({ "n", "v" }, "<s-l>", "$", { desc = "end of line" })

-- put current dir into command
map("c", "%%", "<C-R>=expand('%:h').'/'<cr>", { desc = "put current dir into command" })

--tmux
map("n", "<c-w>h", function()
  require("tmux").move_left()
end, { desc = "move left" })
map("n", "<c-w>j", function()
  require("tmux").move_bottom()
end, { desc = "move bottom" })
map("n", "<c-w>k", function()
  require("tmux").move_top()
end, { desc = "move top" })
map("n", "<c-w>l", function()
  require("tmux").move_right()
end, { desc = "move right" })
