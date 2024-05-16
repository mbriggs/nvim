-- Function to open the correct journal file
local function open_journal()
  -- Get the current date
  local date = os.date("*t")

  -- Format the date components
  local year = date.year
  local month = string.format("%02d", date.month)
  local month_name = os.date("%b", os.time { year = year, month = date.month, day = 1 })

  -- Construct the file path
  local journal_dir = string.format("%s/notes/journal/%d", os.getenv("HOME"), year)
  local journal_file = string.format("%s/%02d-%s.org", journal_dir, date.month, month_name)

  -- Open the journal file
  vim.fn.mkdir(journal_dir, "p")
  vim.cmd("edit " .. journal_file)
end

vim.api.nvim_create_user_command('Journal', open_journal, {})
vim.api.nvim_set_keymap('n', '<leader>oj', '<cmd>Journal<CR>', { noremap = true, silent = true })

local function insert_journal_header()
  -- Get the current line content
  local current_line = vim.api.nvim_get_current_line()

  -- Define the formatted date string
  local date_string = "* " .. os.date("%A - %d %b")

  -- Insert the date string into the current line
  vim.api.nvim_set_current_line(date_string)

  -- Leave insert mode
  vim.api.nvim_command("stopinsert")
end



return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    require("orgmode").setup({
      org_agenda_files = "~/notes/**/*",
      org_default_notes_file = "~/notes/refile.org",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "org",
      callback = function()
        vim.keymap.set("i", "<f5>", '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
          silent = true,
          buffer = true,
        })

        vim.keymap.set("n", "<leader>oiH", function() insert_journal_header() end,
          { noremap = true, silent = true, desc = "Insert journal header" })
      end,
    })
  end,
}
