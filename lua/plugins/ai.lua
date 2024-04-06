-- Github Copilot
-- Mappings are in alacritty config
-- cmd-; - accept
-- cmd-] - next
-- cmd-[ - prev
return {
    {
        "zbirenbaum/copilot.lua",
        main = "copilot",
        event = "VeryLazy",
        config = function()
            require("copilot").setup({
                suggestion = {
                    auto_trigger = true,
                },
                file_types = {
                    ["*"] = true,
                },
            })
            vim.cmd([[Copilot auth]])
        end,
    }
}
