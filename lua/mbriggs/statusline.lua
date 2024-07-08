_G.StatusLine = {}
StatusLine = _G.StatusLine

-- Define the status line function
function StatusLine.active()
  -- Check if the current buffer is a Telescope buffer
  local is_telescope = vim.bo.filetype == "TelescopePrompt"
  local is_neogit = vim.bo.filetype == "NeogitStatus"

  -- Get the file path relative to the project root (cwd), without the filename
  local filepath = vim.fn.fnamemodify(vim.fn.expand("%:~:."), ":h")
  -- Get just the filename
  local filename = vim.fn.expand("%:t")
  -- If no file, show "[No Name]"
  local is_no_name = false
  if is_telescope then
    filename = "[Telescope]"
  elseif is_neogit then
    filename = "[Neogit]"
  elseif filename == "" then
    filename = "[No Name]"
    is_no_name = true
  end

  local is_file_buffer = (not is_no_name and not is_neogit and not is_telescope and filepath ~= "")

  -- Get the file icon and color using nvim-web-devicons
  local icon, _ = require("nvim-web-devicons").get_icon(filename, vim.fn.expand("%:e"), { default = true })

  -- Use a representational single-width symbol for indicating a modified file or the default '[+]'
  local modified = (vim.bo.modified and is_file_buffer) and " [+]" or ""

  -- Assemble the status line components
  local components = {
    "%#StatusLine#", -- Highlight group
    (is_telescope and " ") or (is_neogit and "") or (icon and ("%#StatusLineIcon#" .. icon .. " ")) or "", -- Telescope or file type icon
    " ",
    is_file_buffer and ("%#StatusLinePath#" .. filepath .. "/") or "", -- File path with its own highlight
    is_file_buffer and ("%#StatusLineFile#" .. filename) or ("%#StatusLinePath#" .. filename), -- File name with white bold highlight
    "%#StatusLineModified#", -- Modified indicator highlight
    modified, -- Modified indicator
    "%#StatusLine#", -- Reset to default highlight
    " ",
    "%=%#StatusLineFT#", -- Align right
    vim.bo.filetype, -- File type
    " ",
    "%l:%c", -- Line and column
  }

  -- Combine components with no additional space between filename and path
  return table.concat(components, "")
end

StatusLine.inactive = function()
  return "%#StatusLineNC#%f %m %r%h %w %y"
end

StatusLine.short = function()
  return "%#StatusLine#%f %m %r%h %w %y"
end
--- Define highlight groups using static colors from Catppuccin Frappe palette
--- vim.cmd("highlight StatusLine guifg=#c6d0f5 guibg=#303446 gui=bold") -- Lavender (text) on dark background
vim.cmd("highlight StatusLineIcon guifg=#a6d189 guibg=#292c3c")       -- Use a static greenish color for icons
vim.cmd("highlight StatusLinePath guifg=#9ca0a4 guibg=#292c3c")       -- Dimmed color for the file path (Grayish)
vim.cmd("highlight StatusLineFile guifg=#ffffff guibg=#292c3c")       -- White color for the filename, bold
vim.cmd("highlight StatusLineFT guifg=#f2d5cf guibg=#292c3c")         -- Peach (text) on dark background
vim.cmd("highlight StatusLineModified guifg=#f4b8e4 guibg=#292c3c")   -- Pink/purple for modified indicator

vim.api.nvim_exec(
  [[
  augroup StatusLine
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.StatusLine.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.StatusLine.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.StatusLine.short()
  augroup END
]],
  false
)
