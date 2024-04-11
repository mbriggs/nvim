return {
    dependencies = {
        'leoluz/nvim-dap-go',
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        'theHamsta/nvim-dap-virtual-text',
    },
    'mfussenegger/nvim-dap',
    config = function()
        require("dapui").setup({
            layouts = {
                {
                    position = "bottom",
                    size = 10,
                    elements = {
                        {
                            id = "repl",
                            size = 0.25
                        },
                        {
                            id = "stacks",
                            size = 0.25
                        },
                        {
                            id = "scopes",
                            size = 0.5
                        },
                    },
                }
            },
        })

        require("nvim-dap-virtual-text").setup()

        require("dap-go").setup()
    end,
    keys = {
        { "<leader>db", [[<cmd>lua require('dap').toggle_breakpoint()<CR>]],                                           desc = "Toggle breakpoint" },
        { "<leader>dr", [[<cmd>lua require('dap').repl_open()<CR>]],                                                   desc = "Open REPL" },
        { "<leader>dl", [[<cmd>lua require('dap').run_last()<CR>]],                                                    desc = "Run last configuration" },
        { "<leader>dU", [[<cmd>lua require('dapui').toggle()<CR>]],                                                    desc = "Toggle DAP UI" },
        { "<leader>du", [[<cmd>lua require('dap').up()<CR>]],                                                          desc = "Go up the stack" },
        { "<leader>dd", [[<cmd>lua require('dap').down()<CR>]],                                                        desc = "Go down the stack" },
        { "<leader>dc", [[<cmd>lua require('dap').run_to_cursor()<CR>]],                                               desc = "Continue to cursor" },
        { "<leader>dK", [[<cmd>lua require('dap').disconnect()<CR>]],                                                  desc = "Kill the current session" },
        { "<leader>dk", [[<cmd>lua require('dap.ui.widgets').hover()<CR>]],                                            desc = "Hover" },
        { "<leader>dh", [[<cmd>lua require('dap').focus_frame()<CR>]],                                                 desc = "Go back to current frame" },
        { "<leader>dp", [[<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]], desc = "Toggle breakpoint" },
        { "<leader>ds", [[<cmd>lua require('dap.ui.widgets').sidebar(require('dap.ui.widgets').scopes).open()<cr>]],   desc = "Open sidebar" },
        { "<f5>",       [[<cmd>lua require('dap').continue()<CR>]],                                                    desc = "Continue" },
        { "<f10>",      [[<cmd>lua require('dap').step_over()<CR>]],                                                   desc = "Step over" },
        { "<f11>",      [[<cmd>lua require('dap').step_into()<CR>]],                                                   desc = "Step into" },
        { "<f12>",      [[<cmd>lua require('dap').step_out()<CR>]],                                                    desc = "Step out" },
    }
}
