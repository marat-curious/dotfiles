HOME = os.getenv("HOME")

local set = vim.opt

-- disable cursor-styling
set.guicursor = ""
-- auto-update a file
set.autoread = true
-- set UTF-8 encoding
set.encoding = "utf-8"
set.fileencoding = "utf-8"
set.termencoding = "utf-8"
-- search relative to current file + directory
set.path = ".,,**"
-- enhance command-line completion
set.wildmenu = true
set.wildmode = "list:longest,full"
-- prevent redraw while executing macros
set.lazyredraw = true
-- highlight matching braces
set.showmatch = true
-- highlight matching pairs of brackets (default "(:),{:},[:]")
set.matchpairs:append {"<:>"}
-- configure tabwidth and insert spaces instead of tabs
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
-- add full file path to statusline
set.statusline = "%f %=%l:%c"
-- centralize backups and swapfiles
set.undodir = HOME .. "/.vim/tmp/undo//"
set.backupdir = HOME .. "/.vim/backups//"
set.directory = HOME .. "/.vim/swaps//"
-- set maximum width
set.textwidth = 80
set.colorcolumn = "+1"
-- always show signcolumn
set.signcolumn = "yes"
-- global status line
set.laststatus = 3
