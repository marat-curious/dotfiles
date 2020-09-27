set grepprg=LC_ALL=C\ grep\ -nrsH\ --exclude-dir={node_modules,.git}
set wildignore=**/node_modules/**

setlocal isfname+=@-@
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
setlocal suffixesadd+=.js,.jsx,.json
