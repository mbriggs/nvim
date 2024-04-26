return {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    version = "*",
    opts = {
        load = {
            ["core.defaults"] = {},
            ["core.journal"] = {
                config = {
                    journal_dir = "~/notes/journal",
                    strategy = "%Y-%m-%b",
                },
            },
            ["core.keybinds"] = {
                config = {
                    default_keybinds = true,
                    neorg_leader = "<LocalLeader>o",
                    hook = function(keybinds)
                        keybinds.unmap("norg", "n", "<CR>")
                    end,
                },
            },
            ["core.concealer"] = {
                config = {
                    icons = {
                        list = {
                            icons = {
                                "●",
                                "◦",
                                "▪",
                                "▫",
                                "●",
                                "◦",
                                "▪",
                                "▫",
                                "●",
                                "◦",
                                "▪",
                                "▫",
                                "●",
                                "◦",
                                "▪",
                                "▫",
                                "●",
                                "◦",
                                "▪",
                                "▫",
                                "●",
                                "◦",
                                "▪",
                                "▫",
                                "●",
                                "◦",
                                "▪",
                                "▫",
                            },
                        },
                    },
                },
            },
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        universe = "~/notes",
                    },
                    default_workspace = "universe",
                },
            },
            ["core.completion"] = {
                config = {
                    engine = "nvim-cmp",
                },
            },
            ["core.integrations.treesitter"] = {},
            ["core.export"] = {
                config = {
                    export_dir = "~/notes/export",
                },
            },
            ["core.export.markdown"] = {
                config = {
                    extensions = "all",
                },
            },
        },
    },
    keys = {
        { "<leader>ojj", [[<cmd>Neorg journal today<cr>]],    desc = "go to todays Journal" },
        { "<leader>ojt", [[<cmd>Neorg journal template<cr>]], desc = "go to journal template" },
    },
}
