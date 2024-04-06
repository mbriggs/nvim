vim.api.nvim_create_augroup("userft", {})

-- edn is clojure
vim.api.nvim_create_autocmd("BufRead", {
    desc = "set edn to clojure",
    group = "userft",
    pattern = "*.edn",
    command = "set ft=clojure",
})

-- q quits ft=help
vim.api.nvim_create_autocmd("BufRead", {
    desc = "set help to help",
    group = "userft",
    pattern = "help",
    command = "nmap <buffer> q :q<CR>",
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
    command = "setlocal noet ts=4 sw=4 sts=4",
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

-- set merge commands only in a diff buffer
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
    pattern = "*",
    group = "userft",
    callback = function()
        local map = vim.keymap.set
        if vim.wo.diff then
            local opts = { buffer = true, noremap = true, silent = true }
            map("n", "gf", "diffget //2", opts)
            map("n", "gj", "diffget //3", opts)
        end
    end,
})
