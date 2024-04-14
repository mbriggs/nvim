return {
    'vim-test/vim-test',
    dependencies = {
        'jgdavey/tslime.vim'

    },

    init = function()
        vim.g.tslime_always_current_session = 1
        vim.g.tslime_always_current_window = 1

        vim.g["test#strategy"] = 'tslime'
    end,

    keys = {
        { '<leader>tt', '<cmd>TestNearest<cr>', desc = "Test Nearest" },
        { '<leader>tf', '<cmd>TestFile<cr>',    desc = "Test Current File" },
        { '<leader>ta', '<cmd>TestSuite<cr>',   desc = "Test Whole Suite" },
        { '<leader>tl', '<cmd>TestLast<cr>',    desc = "Rerun last test" },
        { '<leader>tg', '<cmd>TestVisit<cr>',   desc = "Visit last test" },
    }
}
