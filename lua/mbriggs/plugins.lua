local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", { change_detection = { notify = false } })
vim.cmd.packadd("cfilter") -- use cfilter for filtering quickfix list

vim.keymap.set("n", "<leader>z", "<cmd>Lazy<cr>", { desc = "Lazy Package Manager" })
