return {
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
    { "tpope/vim-unimpaired" },
    { "tpope/vim-repeat" },
    { "tpope/vim-surround" },
}
