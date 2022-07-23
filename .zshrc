export LC_ALL=en_US.UTF-8

# autocomplit
autoload -U compinit
compinit
autoload -U bashcompinit
bashcompinit

# vi mode
bindkey -v

bindkey '^p' up-history
bindkey '^n' down-history
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
