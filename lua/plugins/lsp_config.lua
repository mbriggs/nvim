local map = require("map")
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"j-hui/fidget.nvim",
		"folke/neodev.nvim", -- configure lua LSP for neovim
	},
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		vim.filetype.add({ extension = { templ = "templ" } })

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"tsserver",
				"gopls",
				"golangci_lint_ls",
				"templ",
				"html",
				"htmx",
				"tailwindcss",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,

				-- required for templ
				["html"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.html.setup({
						capabilities = capabilities,
						filetypes = { "html", "templ" },
					})
				end,

				["htmx"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.html.setup({
						capabilities = capabilities,
						filetypes = { "html", "templ" },
					})
				end,

				["tailwindcss"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.html.setup({
						capabilities = capabilities,
						filetypes = { "templ", "astro", "javascript", "typescript", "react" },
						init_options = { userLanguages = { templ = "html" } },
					})
				end,
				-- end templ
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<cr>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
			}, {
				-- { name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				local desc = map.desc(opts)

				vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, desc("Go to type definition"))
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, desc("Go to definition"))

				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

				vim.keymap.set("n", "<leader>cD", vim.lsp.buf.type_definition, desc("Go to type definition"))
				vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, desc("Go to definition"))
				vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, desc("Go to implementation"))
				vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, desc("Rename symbol"))
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, desc("Code action"))
				vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, desc("Go to references"))
				vim.keymap.set("n", "<leader>cm", function()
					vim.lsp.buf.format({ async = true })
				end, desc("Format document"))
			end,
		})
	end,
}
