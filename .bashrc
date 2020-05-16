
# HISTORY
HISTSIZE=50000
HISTFILESIZE=50000
HISTCONTROL=ignoreboth
shopt -s histappend
## TODO: look up that prepend history env variable
#   that makes the history unified between terminals

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
