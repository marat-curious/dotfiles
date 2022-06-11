-- disable auto-loading of plugins
vim.o.noloadplugins = true
-- auto-update a file
vim.o.autoread = true
-- search relative to current file + directory
vim.o.path = '.,,**'
-- enhance command-line completion
vim.o.wildmode = 'list:longest,full'
-- prevent redraw while executing macros
vim.o.lazyredraw = true
-- highlight matching braces
vim.o.showmatch = true
-- highlight matching pairs of brackets (default "(:),{:},[:]")
vim.o.matchpairs += '<:>'
-- configure tabwidth and insert spaces instead of tabs
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
-- add full file path to statusline
vim.o.statusline += '%F\ %=%l\:%c'
-- reset cursor style
vim.o.quicursor = ''
