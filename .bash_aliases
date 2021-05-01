##### Aliases #####
# ls aliases
alias l='ls -oaAthF | head && echo "..."' # short output of 10 recent items
alias ll="ls -alhF"
alias la="ll"
alias lt="ll -t"
alias ltr="echo 'Add -r to reverse list'"

# cd aliases
alias ..="cd .."
alias cdg="cd $HOME/git"
alias cdr="cd $HOME/git/rust"
alias cds="cd $HOME/scripts"
alias cdac="cd $HOME/git/my-dotfiles/awesome-config"

# Safer rm
alias rm="rm -i"

# System
alias sys="systemctl"
alias j="journalctl -xe"

# Virtual Machines
alias vm="virsh --connect quemu:///system"
alias launch_w10="sudo bash $HOME/scripts/virt-manager/launch_w10.sh"

# Display / Window Management
alias mkscript="${HOME}/scripts/helpers/new_script.sh"

# ------------------------------------------------------------
# Dotfiles git tools
alias dotf="/usr/bin/git --git-dir=$HOME/git/my-dotfiles/dotfiles/ --work-tree=$HOME $*"
alias ds="(cd $HOME; dotf status -u)"
alias dotlist="dotf ls-tree --full-tree --name-only -r HEAD"
alias dotdiff="dotf difftool"
alias dtn="(cd $HOME; dotf config --local status.showUntrackedFiles no)"
alias dty="(cd $HOME; dotf config --local status.showUntrackedFiles all)"
# Dotfile setup info/sources
# https://www.youtube.com/watch?v=tBoLDpTWVOM
# https://www.atlassian.com/git/tutorials/dotfiles
# ------------------------------------------------------------

# Awesome config
alias uac="(cd $HOME/git/my-dotfiles/awesome-config; sh ./update_awesome_config.sh)"

# git aliases
alias gs="git status"
alias gp="git pull"
alias undocommit="git reset --soft HEAD~1"

# VPN
alias v="nordvpn status"
alias vd="nordvpn disconnect"
alias vcu="nordvpn connect united_kingdom"
alias vci="nordvpn connect ireland"
alias vcn="nordvpn connect netherlands"
alias vcf="nordvpn connect france"
alias vcs="nordvpn connect spain"
alias vcusa="nordvpn connect united_states"

# Man/Command Helpers
alias cheat='function cheat() { curl cheat.sh/$*; }; cheat'






