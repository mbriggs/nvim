-- Formatting and linting
-- https://github.com/jose-elias-alvarez/null-ls.nvim
local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

return {
	debug = false,
	sources = {
		formatting.prettierd,
		formatting.cmake_format,
		formatting.shfmt,
		formatting.goimports,
		formatting.sqlformat,
		formatting.stylua,
		formatting.cljstyle,
		formatting.rubocop,
		formatting.mix,

		diagnostics.shellcheck,
		diagnostics.codespell,
		diagnostics.eslint_d,
		diagnostics.hadolint,
		diagnostics.proselint,
		diagnostics.golangci_lint,

		code_actions.eslint_d,
		code_actions.shellcheck,
		code_actions.refactoring,
	},

	-- NOTE: You can remove this on attach function to disable format on save
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_create_autocmd("BufWritePre", {
				desc = "Auto format before save",
				pattern = "<buffer>",
				callback = vim.lsp.buf.formatting_sync,
			})
		end
	end,
}
