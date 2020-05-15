

# HISTORY
HISTSIZE=50000
HISTFILESIZE=50000
HISTCONTROL=ignoreboth
shopt -s histappend
## TODO: look up that prepend history command,
# makes the history unified between terminals


##### Aliases #####
# ls aliases
alias l="ls -a"
alias ll="ls -alF"
alias la="ls -A"

# cd aliases
alias ..="cd .."
alias cdg="cd $HOME/git/"

# Dotfiles git tools
alias dotfiles="/usr/bin/git --git-dir=$HOME/git/dotfiles/ --work-tree=$HOME $*"
alias ds="(cd $HOME; dotfiles status)"
# Dotfile setup info/sources
# https://www.youtube.com/watch?v=tBoLDpTWVOM
# https://www.atlassian.com/git/tutorials/dotfiles

# git aliases
alias gs="git status"




