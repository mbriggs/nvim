vim.api.nvim_create_augroup("userft", {})

-- edn is clojure
vim.api.nvim_create_autocmd("BufRead", {
  desc = "set edn to clojure",
  group = "userft",
  pattern = "*.edn",
  command = "set ft=clojure",
})

-- gohtml is html
vim.api.nvim_create_autocmd("BufRead", {
  desc = "set gohtml to html",
  group = "userft",
  pattern = "*.gohtml",
  command = "set ft=html",
})

-- .envrc is bash
vim.api.nvim_create_autocmd("BufRead", {
  desc = "set envrc to bash",
  group = "userft",
  pattern = ".envrc*",
  command = "set ft=bash",
})

-- set golang formatting
vim.api.nvim_create_autocmd("BufRead", {
  desc = "golang formatting",
  group = "userft",
  pattern = "*.go",
  callback = function()
    vim.opt_local.expandtab = false -- noet: Don't expand tabs to spaces
    vim.opt_local.tabstop = 4       -- ts=4: Number of spaces that a <Tab> in the file counts for
    vim.opt_local.shiftwidth = 4    -- sw=4: Size of an indent
    vim.opt_local.softtabstop = 4   -- sts=4: Number of spaces that a Tab counts for while performing editing operations

    -- vim.keymap.set("n", "<leader>td", [[<cmd>lua require('dap-go').debug_test()<CR>]],
    --     { buffer = true, noremap = true, silent = true, desc = "Debug Nearest (go)" })
    --
    -- vim.keymap.set("n", "<leader>tD", [[<cmd>lua require('dap-go').debug_last_test()<CR>]],
    --     { buffer = true, noremap = true, silent = true, desc = "Debug Last (go)" })
  end
})

vim.api.nvim_create_autocmd("BufRead", {
  desc = "golang mod file ft",
  group = "userft",
  pattern = "go.mod",
  command = "set ft=gomod",
})

vim.api.nvim_create_autocmd("BufRead", {
  desc = "golang sum file ft",
  group = "userft",
  pattern = "go.sum",
  command = "set ft=gosum",
})

vim.api.nvim_create_autocmd("BufRead", {
  desc = "golang workspace file ft",
  group = "userft",
  pattern = "go.work",
  command = "set ft=gowork",
})
