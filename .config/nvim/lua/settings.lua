HOME = os.getenv("HOME")

local opt = vim.opt

-- disable cursor-styling
opt.guicursor = ""
-- auto-update a file
opt.autoread = true
-- set UTF-8 encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.termencoding = "utf-8"
-- search relative to current file + directory
opt.path:append {"**"}
-- enhance command-line completion
opt.wildmenu = true
opt.wildmode = "list:longest,full"
-- prevent redraw while executing macros
opt.lazyredraw = true
-- highlight matching braces
opt.showmatch = true
-- highlight matching pairs of brackets (default "(:),{:},[:]")
opt.matchpairs:append {"<:>"}
-- configure tabwidth and insert spaces instead of tabs
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
-- add full file path to statusline
opt.statusline = "%f %=%l:%c"
-- centralize backups and swapfiles
opt.undodir = HOME .. "/.vim/tmp/undo//"
opt.backupdir = HOME .. "/.vim/backups//"
opt.directory = HOME .. "/.vim/swaps//"
-- set maximum width
opt.textwidth = 80
opt.colorcolumn = "+1"
-- always show signcolumn
opt.signcolumn = "yes"
-- global status line
opt.laststatus = 3
