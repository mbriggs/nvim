-- set up custom keymaps
require("mbriggs.map")

-- load vim settings
require("mbriggs.set")

-- set up filetypes for certain extensions
require("mbriggs.ft.extmaps")

-- set up cr mapping based on filetypes
require("mbriggs.ft.crmap")

-- set up merge maps
require("mbriggs.ft.mergemaps")

-- set up qf maps
require("mbriggs.ft.qf")

-- set up completion / snippets
require("mbriggs.completion")

-- load and configure third party plugins
require("mbriggs.plugins")

-- configure netrw
require("mbriggs.netrw")

-- statusline
require("mbriggs.statusline")
