# Kakoune.cr - A command-line tool for Kakoune
# https://github.com/alexherbo2/kakoune.cr

evaluate-commands %sh{
  kcr init kakoune
}

map -docstring 'new' global normal <c-t> ':new<ret>'
map -docstring 'terminal' global normal <c-ret> ':connect terminal<ret>'
map -docstring 'file picker' global normal <c-f> ':connect terminal kcr fzf files<ret>'
map -docstring 'buffer picker' global normal <c-b> ':connect terminal kcr fzf buffers<ret>'
map -docstring 'grep picker' global normal <c-g> ':connect terminal kcr fzf grep<ret>'
map -docstring 'grep picker (buffer)' global normal <c-r> ':connect terminal kcr fzf grep %val{buflist}<ret>'
