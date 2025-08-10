# Ctags: universal-ctags

set-option global ctagscmd "uctags -R --fields=+S"
set-option global readtagscmd "ureadtags"
map global normal <a-.> :ctags-search<ret>
