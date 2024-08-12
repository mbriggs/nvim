return {
	"nvimdev/guard.nvim",
	dependencies = {
		"nvimdev/guard-collection",
	},
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local ft = require("guard.filetype")

		ft("lua"):fmt("lsp"):append("stylua")
		ft("typescript,javascript,typescriptreact"):fmt("prettier")
		ft("go"):fmt({ cmd = "goimports", stdin = true })
		ft("sh"):fmt("shfmt")
		ft("templ"):fmt({ cmd = "templ", args = { "fmt" }, stdin = true })
		-- ft("ruby"):fmt("rubocop")
		ft("sql"):fmt("sql-formatter")

		require("guard").setup({
			fmt_on_save = true,
			lsp_as_default_formatter = true,
		})
	end,
}
