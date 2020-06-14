##### Aliases #####
# ls aliases
alias l='ls -oaAthF | head && echo "..."' # short output of 10 recent items
alias ll="ls -alhF"
alias la="ls -AF"

# cd aliases
alias ..="cd .."
alias cdg="cd $HOME/git/"

# Display / Window Management
alias mkscript="${HOME}/scripts/new_script.sh"

# ------------------------------------------------------------
# Dotfiles git tools
alias dotf="/usr/bin/git --git-dir=$HOME/git/dotfiles/ --work-tree=$HOME $*"
alias ds="(cd $HOME; dotf status -u)"
alias dotlist="dotf ls-tree --full-tree --name-only -r HEAD"
alias dotdiff="dotf difftool"
alias dtn="(cd $HOME; dotf config --local status.showUntrackedFiles no)"
alias dty="(cd $HOME; dotf config --local status.showUntrackedFiles all)"
# Dotfile setup info/sources
# https://www.youtube.com/watch?v=tBoLDpTWVOM
# https://www.atlassian.com/git/tutorials/dotfiles
# ------------------------------------------------------------

# git aliases
alias gs="git status"
alias gp="git pull"
alias undocommit="git reset --soft HEAD~1"

# image viewer reminder
alias image='echo "use the \"feh\" command & arrow keys to change size"'

# VPN
alias v="nordvpn status"
alias vd="nordvpn disconnect"
alias vcu="nordvpn connect united_kingdom"
alias vci="nordvpn connect ireland"
alias vcn="nordvpn connect netherlands"
alias vcf="nordvpn connect france"
alias vcusa="nordvpn connect united_states"
