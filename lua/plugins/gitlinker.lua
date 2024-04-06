return {
    "ruifm/gitlinker.nvim",
    event = "BufRead",
    opts = {
        -- remote = 'github', -- force the use of a specific remote
        -- adds current line nr in the url for normal mode
        add_current_line_on_normal_mode = true,
        -- callback for what to do with the url
        action_callback = function(url)
            require("gitlinker.actions").copy_to_clipboard(url)
        end,
        -- print the url after performing the action
        print_url = false,
        -- mapping to call url generation
        mappings = "<leader>gy",
    },
    requires = "nvim-lua/plenary.nvim",
}
