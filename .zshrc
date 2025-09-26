export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# autocomplit
autoload -U compinit
compinit
autoload -U bashcompinit
bashcompinit
autoload -U select-word-style
select-word-style bash

# vi [-v] or emacs [-e] mode
bindkey -e

bindkey '^p' up-history
bindkey '^n' down-history
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# prompt
export PROMPT="%~%f [%?] %# "

# kcr (kakoune.cr) - https://github.com/alexherbo2/kakoune.cr
alias K='kcr-fzf-shell'
alias KK='K --working-directory .'
alias k='kcr edit'
alias ks='kcr shell --session'
alias kl='kcr list'
alias a='kcr attach'
alias :f='kcr fzf files'
alias f:='KK kcr fzf files'
alias :g='kcr fzf grep'
alias g:='KK kcr fzf grep'
