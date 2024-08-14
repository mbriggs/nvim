return {
	{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "VeryLazy" },
		config = function()
			require("nvim-treesitter.configs").setup({
				-- A list of parser names, or "all"
				ensure_installed = {
					"vimdoc",
					"javascript",
					"typescript",
					"markdown",
					"markdown_inline",
					"html",
					"embedded_template",
					"c",
					"lua",
					"templ",
					"rust",
					"jsdoc",
					"bash",
					"sql",
					"ruby",
					"go",
					"gomod",
					"gowork",
					"gosum",
				},

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
				auto_install = true,

				indent = {
					enable = false,
				},

				highlight = {
					-- `false` will disable the whole extension
					enable = true,
					additional_vim_regex_highlighting = { "markdown" },
				},
			})

			local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			treesitter_parser_config.templ = {
				install_info = {
					url = "https://github.com/vrischmann/tree-sitter-templ.git",
					files = { "src/parser.c", "src/scanner.c" },
					branch = "master",
				},
			}

			require("nvim-treesitter.install").compilers = { "gcc-14" }

			vim.treesitter.language.register("templ", "templ")
		end,
	},
}
