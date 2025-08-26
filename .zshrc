export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# autocomplit
autoload -U compinit
compinit
autoload -U bashcompinit
bashcompinit

# vi [-v] or emacs [-e] mode
bindkey -e

bindkey '^p' up-history
bindkey '^n' down-history
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# prompt
export PROMPT="%~%f %# "
