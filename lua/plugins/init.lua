return {
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
    { -- space to operate on word segment
        "chaoren/vim-wordmotion",
        event = "BufRead",
        setup = [[vim.g.wordmotion_prefix = '<space>']],
    },
    { "tpope/vim-unimpaired" },
    { "tpope/vim-repeat" },
    { "tpope/vim-surround" },
}
