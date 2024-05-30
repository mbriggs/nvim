return {
  "f-person/git-blame.nvim",
  name = "gitblame",
  opts = {
    enabled = false,
    date_format = "%Y.%m.%d",
  },
  keys = {
    { "<leader>gbb", "<cmd>GitBlameToggle<cr>",        desc = "Blame toggle" },
    { "<leader>gbs", "<cmd>GitBlameCopySha<cr>",       desc = "Copy SHA" },
    { "<leader>gbu", "<cmd>GitBlameOpenCommitURL<cr>", desc = "Open commit url" },
    { "<leader>gby", "<cmd>GitBlameCopyCommitURL<cr>", desc = "Copy commit url" },
  },
}
