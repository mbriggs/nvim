-- Core --
-- augment core functionality
local core = {
	-- navigate tmux and vim splits transparently
	{
		"aserowy/tmux.nvim",
		config = require("user.plugins.tmux"),
	},
	-- move splits around
	{
		"sindrets/winshift.nvim",
		config = require("user.plugins.winshift"),
	},
	-- pick window / show visited file path
	{
		"gbrlsnchs/winpick.nvim",
		config = require("user.plugins.winpick"),
	},
	-- open file
	{ "justinmk/vim-gtfo" },
	-- correct typos on file open from cli
	{ "mong8se/actually.nvim" },
	-- casing aware search and replace
	{ "lambdalisue/reword.vim" },
	-- reload file with sudo
	{ "lambdalisue/suda.vim" },
	-- utility mappings
	{ "tpope/vim-unimpaired" },
	-- highlight unique chars
	{ "jinh0/eyeliner.nvim" },
	-- zoom pane with <C-w>m
	{ "dhruvasagar/vim-zoom" },
	-- colors
	{
		"catppuccin/nvim",
		as = "catppuccin",
		config = require("user.plugins.catppuccin"),
		run = ":CatppuccinCompile",
	},
	{
		"katawful/kat.nvim",
		tag = "1.0",
	},
	-- jump in buffer
	{
		"phaazon/hop.nvim",
		config = require("user.plugins.hop"),
	},
}

-- Fix --
-- fix functionality to work better
local fix = {
	-- highlight things like todo in comments
	{
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = require("user.plugins.todo-comments"),
	},
	-- tint inactive windows
	-- TODO: uncomment when 0.8.0 lands
	-- {
	-- 	"levouh/tint.nvim",
	-- 	config = require("user.plugins.tint"),
	-- },
	-- open files over ssh
	{ "lambdalisue/vim-protocol" },
	-- highlight yanks
	{ "machakann/vim-highlightedyank" },
	-- support . for more things
	{ "tpope/vim-repeat" },
	-- work on delims
	{
		"kylechui/nvim-surround",
		config = require("user.plugins.surround"),
	},
	-- do not jump on star
	{
		"ironhouzi/starlite-nvim",
		config = require("user.plugins.starlite"),
	},
	-- advanced qflist
	{
		"kevinhwang91/nvim-bqf",
		requires = {
			{ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" },
			"junegunn/fzf.vim",
		},
		ft = "qf",
	},

	{
		"smartpde/telescope-recent-files",
		after = "telescope.nvim",
		config = require("user.plugins.telescope-recent-files"),
	},
	{
		"nvim-telescope/telescope-live-grep-args.nvim",
		after = "telescope.nvim",
		config = require("user.plugins.telescope-live-grep"),
	},
}

-- LSP --
-- language server tools
local lsp = {
	-- popup documentation
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = require("user.plugins.lsp_signature"),
	},
	-- refactoring tools
	{
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	-- diagnostic window
	{
		"folke/lsp-trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = require("user.plugins.trouble"),
		cmd = "TroubleToggle",
	},
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = require("user.plugins.lsp_lines"),
	},
}

-- Objects --
-- custom text objects
local objects = {
	-- space = operate on segment
	{ "chaoren/vim-wordmotion", setup = [[vim.g.wordmotion_prefix = '<space>']] },
	-- gs = sort
	{ "ralismark/opsort.vim" },
	-- many things
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		requires = "nvim-treesitter/nvim-treesitter",
	},
}

-- Tools --
-- add tools to nvim
local tools = {
	-- generate links to github
	{
		"ruifm/gitlinker.nvim",
		event = "BufRead",
		config = require("user.plugins.gitlinker"),
		requires = "nvim-lua/plenary.nvim",
	},

	-- diff stuff
	{ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },

	-- go tooling
	{
		"olexsmir/gopher.nvim",
		requires = { -- dependencies
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = require("user.plugins.gopher"),
	},
	-- run tests
	{
		"janko/vim-test",
		requires = "preservim/vimux",
		config = [[vim.g['test#strategy'] = 'vimux']],
	},
	-- with code coverage
	{
		"andythigpen/nvim-coverage",
		requires = "nvim-lua/plenary.nvim",
		config = require("user.plugins.coverage"),
	},
	-- search & replace panel
	{
		"windwp/nvim-spectre",
		requires = "nvim-lua/plenary.nvim",
		config = require("user.plugins.spectre"),
	},
}

-- Clojure --
-- clojure specific stuff
local clj = {
	-- connect repl to editor
	{ "Olical/conjure" },
	-- infer paren balancing
	{ "eraserhd/parinfer-rust", run = "CARGO_NET_GIT_FETCH_WITH_CLI=true cargo build --release" },
	-- ability to start nrepl from inside vim
	{
		"clojure-vim/vim-jack-in",
		requires = {
			{ "radenling/vim-dispatch-neovim", requires = { { "tpope/vim-dispatch" } } },
		},
	},
	-- structural editing
	{ "guns/vim-sexp", requires = { { "tpope/vim-sexp-mappings-for-regular-people" } } },
}

local function label(plugins)
	local labelled = {}
	for _, plugin in ipairs(plugins) do
		labelled[plugin[1]] = plugin
	end
	return labelled
end

return function(plugins)
	-- Disabled Default Plugins
	plugins["glepnir/dashboard-nvim"] = nil
	plugins["goolord/alpha-nvim"] = nil
	plugins["Shatur/neovim-session-manager"] = nil
	plugins["akinsho/bufferline.nvim"] = nil
	plugins["p00f/nvim-ts-rainbow"] = nil
	plugins["rafamadriz/friendly-snippets"] = nil
	plugins["L3MON4D3/LuaSnip"] = {
		config = function()
			require("configs.luasnip")
		end,
	}

	local combined = vim.tbl_deep_extend(
		"force",
		plugins,
		label(core),
		label(tools),
		label(fix),
		label(lsp),
		label(objects),
		label(clj)
	)

	return combined
end
