" disable auto-loading of plugins
set noloadplugins
" disable vi compatibility
set nocompatible
" add filetype and plugin support
filetype plugin on
" auto-update a file
set autoread
" search relative to current file + directory
set path=.,,**
" tags relative to current file + directory
set tags=./tags;,tags;
" allow backspace in insert mode
set backspace=indent,eol,start
" set UTF-8 encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
" switch on auto-indentation
set autoindent
" enhance command-line completion
set wildmenu
set wildmode=list:longest,full
" prevent redraw while executing macros
set lazyredraw
" switch syntax highlighting off
syntax off
" turn line numbers on
set number
" highlight matching braces
set showmatch
" highlight matching pairs of brackets (default "(:),{:},[:]")
set matchpairs+=<:>
" wrap lines at 120 chars
set textwidth=120
" configure tabwidth and insert spaces instead of tabs
set tabstop=2       " tab width is 2 spaces
set shiftwidth=2    " indent also with 2 spaces
set expandtab       " expand tabs to spaces
" display cursor position
set ruler
" display status line always
set laststatus=2
" add full file path to statusline
set statusline+=%F\ %=%l\:%c
" enable 256 color support
set t_Co=256
" set highlight-groups
highlight LineNr NONE
highlight CursorLine NONE
highlight Pmenu ctermbg=Gray
" centralize backups and swapfiles
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
