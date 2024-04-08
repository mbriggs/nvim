return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
        { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
        { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    opts = {
        --debug = true, -- Enable debugging
        -- See Configuration section for rest
    },
    keys = {
        {
            "<leader>cc",
            "<Cmd>CopilotChatToggle<CR>",
            desc = "Toggle Copilot Chat"
        },
        {
            "<leader>ce",
            "<Cmd>CopilotChatExplain<CR>",
            mode = { "n", "v" },
            desc = "Explain this code"
        },
        {
            "<leader>cf",
            "<Cmd>CopilotChatFix<CR>",
            mode = { "n", "v" },
            desc = "Fix this code"
        },
    },
}
