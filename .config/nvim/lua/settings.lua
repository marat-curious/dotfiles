HOME = os.getenv("HOME")

-- disable cursor-styling
vim.o.guicursor = ""
-- disable auto-loading of plugins
vim.o.loadplugins = false
-- auto-update a file
vim.o.autoread = true
-- set UTF-8 encoding
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.termencoding = "utf-8"
-- search relative to current file + directory
vim.o.path = ".,,**"
-- tags relative to current file + directory
vim.o.tags = "./tags;,tags;"
-- enhance command-line completion
vim.o.wildmenu = true
vim.o.wildmode = "list:longest,full"
-- prevent redraw while executing macros
vim.o.lazyredraw = true
-- switch syntax highlighting off
vim.o.syntax = "off"
-- highlight matching braces
vim.o.showmatch = true
-- highlight matching pairs of brackets (default "(:),{:},[:]")
vim.o.matchpairs = vim.o.matchpairs .. ",<:>"
-- configure tabwidth and insert spaces instead of tabs
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
-- add full file path to statusline
vim.o.statusline = vim.o.statusline .. "%F %=%l:%c"
-- centralize backups and swapfiles
vim.o.undodir = HOME .. "/.vim/tmp/undo//"
vim.o.backupdir = HOME .. "/.vim/backups//"
vim.o.directory = HOME .. "/.vim/swaps//"

vim.o.textwidth = 80
vim.o.colorcolumn = "+1"

vim.o.signcolumn = "yes"
