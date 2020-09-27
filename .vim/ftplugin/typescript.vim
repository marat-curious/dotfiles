set wildignore=**/node_modules/**

let &l:errorformat = '%-G,%EERROR: %f:%l:%c - %m,%WWARNING: %f:%l:%c - %m,%E%f(%l\,%c): error %m,%E%f(%l\,%c): error %m,%E%f(%l\,%c): %m,%Eerror %m'
let &l:makeprg = 'tsmake'

setlocal grepprg=LC_ALL=C\ grep\ -nrsH\ --exclude-dir={node_modules,.git}
setlocal syntax=typescript
setlocal suffixesadd+=.ts,.tsx,.json,.js
setlocal include=\\%(\\<require\\s*(\\s*\\\|\\<import\\>[^;\"']*\\)[\"']\\zs[^\"']*
setlocal define=^\\s*\\(export\ \\)\\?\\<\\(type\\\|var\\\|interface\\\|const\\\|let\\\|\\(async\ \\)\\?function\\\|class\\)\\>
setlocal isfname+=@-@
setlocal commentstring=//\ %s
