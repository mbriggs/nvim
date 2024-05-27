vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  pattern = "*",
  group = "userft",
  callback = function()
    local map = vim.keymap.set
    if vim.wo.diff then
      local opts = { buffer = true, noremap = true, silent = true }
      map("n", "gf", "diffget //2", opts)
      map("n", "gj", "diffget //3", opts)
    end
  end,
})
