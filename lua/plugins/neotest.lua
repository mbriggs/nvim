return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",


        "nvim-neotest/neotest-go",
        -- "nvim-neotest/neotest-jest",
        -- "olimorris/neotest-rspec",
        -- "zidhuss/neotest-minitest",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-go")({
                    experimental = {
                        test_table = true,
                    },
                }),

                -- require("neotest-jest")({
                -- 	jestCommand = require("neotest-jest.jest-util").getJestCommand(vim.fn.expand("%:p:h"))
                -- 		.. " --watch",
                -- 	jestConfigFile = "custom.jest.config.ts",
                -- 	env = { CI = true },
                -- 	cwd = function(path)
                -- 		return vim.fn.getcwd()
                -- 	end,
                -- }),
                --
                -- require("neotest-rspec")({
                -- 	rspec_cmd = function()
                -- 		return vim.tbl_flatten({
                -- 			"bundle",
                -- 			"exec",
                -- 			"rspec",
                -- 		})
                -- 	end,
                -- }),
                --
                -- require("neotest-minitest")({
                -- 	test_cmd = function()
                -- 		return vim.tbl_flatten({
                -- 			"bundle",
                -- 			"exec",
                -- 			"rails",
                -- 			"test",
                -- 		})
                -- 	end,
                -- }),
            },
        })
    end,

    keys = {
        { "<leader>tww", [[<cmd>lua require("neotest").watch.toggle()<cr>]],                                                    desc = "Toggle watching test at point" },
        { "<leader>twf", [[<cmd>lua require("neotest").watch.toggle(vim.fn.expand("%"))<cr>]],                                  desc = "Toggle watching test file at point" },
        { "<leader>tt",  [[<cmd>lua require("neotest").run.run()<cr>]],                                                         desc = "Run test at point" },
        { "<leader>tl",  [[<cmd>lua require("neotest").run.run_last()<cr>]],                                                    desc = "Run test at point" },
        { "<leader>tc",  [[<cmd>lua require("neotest").output.open({ enter = true, auto_close = true })<cr>]],                  desc = "Open test output panel" },
        { "<leader>to",  [[<cmd>lua require("neotest").output.open({ last_run = true, enter = true, auto_close = true })<cr>]], desc = "Open test output panel for the last run" },
        { "<leader>tpp", [[<cmd>lua require("neotest").output_panel.toggle()<cr>]],                                             desc = "Toggle output panel" },
        { "<leader>tpc", [[<cmd>lua require("neotest").output_panel.clear()<cr>]],                                              desc = "Clear output panel" },
        { "<leader>tf",  [[<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>]],                                       desc = "Run current file" },
        { "<leader>td",  [[<cmd>lua require("neotest").run.run({strategy = "dap"})<cr>]],                                       desc = "Debug test at point" },
        { "<leader>tk",  [[<cmd>lua require("neotest").run.stop()<cr>]],                                                        desc = "Kill test at point" },
        { "<leader>ts",  [[<cmd>lua require("neotest").summary.toggle()<cr>]],                                                  desc = "Toggle Summary" },
    }
}
