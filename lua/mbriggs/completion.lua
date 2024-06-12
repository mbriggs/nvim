local map = vim.keymap.set

-- dabbrev style completion
map("i", "<D-/>", "<C-x><C-n>", { desc = "next completion" })

map({ "s", "i" }, "<Tab>", function()
	if vim.snippet.active({ direction = 1 }) then
		vim.snippet.jump(1)
	elseif next(vim.lsp.get_clients({ bufnr = 0 })) and vim.lsp.completion then
		vim.lsp.completion.trigger()
	end
end)

map("s", "<S-Tab>", function()
	if vim.snippet.active({ direction = -1 }) then
		vim.snippet.jump(-1)
	end
end)
