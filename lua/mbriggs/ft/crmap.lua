-- Define the lists of inappropriate buffer types and file types
local inappropriate_buftypes = { "quickfix", "nofile", "terminal", "help" }
local inappropriate_filetypes = { "qf", "undotree", "help", "gitcommit", "netrw", "copilot-chat" }

-- Function to check if the current buffer type or file type is inappropriate
local function is_inappropriate_context()
	local buftype = vim.api.nvim_buf_get_option(0, "buftype")
	local filetype = vim.api.nvim_buf_get_option(0, "filetype")

	for _, bt in ipairs(inappropriate_buftypes) do
		if buftype == bt then
			return true
		end
	end

	for _, ft in ipairs(inappropriate_filetypes) do
		if filetype == ft then
			return true
		end
	end

	return false
end

-- Function to update the keymap based on the context
local function update_keymap()
	if is_inappropriate_context() then
		-- pcall(vim.api.nvim_buf_del_keymap, 0, "n", "<CR>")
		return
	end

	vim.keymap.set("n", "<CR>", ":nohlsearch<CR>:w<CR>", { desc = "save and clear highlights", buffer = 0 })
end

-- Create autocommands to call this function on buffer enter and file type change
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
	callback = update_keymap,
	desc = "Update <CR> mapping based on context",
})
