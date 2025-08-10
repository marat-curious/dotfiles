# Make

define-command recompile %{write-all make}

map global normal <c-m> ":make<ret>"
map global normal <c-r> ":recompile<ret>"
map global normal <c-n> ":make-next-error<ret>"
