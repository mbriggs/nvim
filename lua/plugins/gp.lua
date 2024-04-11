return {
    "robitx/gp.nvim",
    name = "gp",
    opts = {
        openai_api_key = { "op", "read", "op://Personal/OpenAI/key" },
        chat_shortcut_respond = { modes = { "n" }, shortcut = "<cr>" },
        chat_shortcut_delete = { modes = { "n" }, shortcut = "<leader>cK" },
        chat_shortcut_stop = { modes = { "n" }, shortcut = "<leader>ck" },
        chat_shortcut_new = { modes = { "n", "i", "v", "x" }, shortcut = "<C-l>" },
        agents = {
            { name = "ChatGPT3-5" },
            {
                name = "ChatGPT4",
                chat = true,
                command = false,
                -- string with model name or table with model name and parameters
                model = { model = "gpt-4-1106-preview", temperature = 1.1, top_p = 1 },
                -- system prompt (use this to specify the persona/role of the AI)
                system_prompt = "You are a general AI assistant.\n\n"
                    .. "The user provided the additional info about how they would like you to respond:\n\n"
                    .. "- If you're unsure don't guess and say you don't know instead.\n"
                    .. "- Ask question if you need clarification to provide better answer.\n"
                    .. "- Think deeply and carefully from first principles step by step.\n"
                    .. "- Zoom out first to see the big picture and then zoom in to details.\n"
                    .. "- Use Socratic method to improve your thinking and coding skills.\n"
                    .. "- Don't elide any code from your output if the answer requires coding.\n"
                    .. "- Take a deep breath; You've got this!\n",
            },
        },
    },
    keys = {
        { "<leader>cc", [[<cmd>GpChatToggle vsplit<cr>]], desc = "Toggle GPT Chat" },
        { "<leader>cC", [[<cmd>GpChatToggle hsplit<cr>]], desc = "Toggle GPT Chat (hsplit)" }
    }
}
