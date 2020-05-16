##### Aliases #####
# ls aliases
alias l='ls -oaAthF | head && echo "..."' # short output of 10 recent items
alias ll="ls -alhF"
alias la="ls -AF"

# cd aliases
alias ..="cd .."
alias cdg="cd $HOME/git/"

# Dotfiles git tools
alias dotfiles="/usr/bin/git --git-dir=$HOME/git/dotfiles/ --work-tree=$HOME $*"
alias ds="(cd $HOME; dotfiles status)"
alias dtn="(cd $HOME; dotfiles config --local status.showUntrackedFiles no)"
alias dty="(cd $HOME; dotfiles config --local status.showUntrackedFiles all)"
# Dotfile setup info/sources
# https://www.youtube.com/watch?v=tBoLDpTWVOM
# https://www.atlassian.com/git/tutorials/dotfiles

# git aliases
alias gs="git status"
