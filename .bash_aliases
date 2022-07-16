## Setup ##

IS_MACOS=$(command -v sw_vers && sw_vers | grep macOS 2> /dev/null)
IS_ARCH_LINUX=$(uname -a | grep "m-arch" 2> /dev/null)

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
alias cdssh="cd $HOME/.ssh"
alias cdz="cd $HOME/vaults/personal/ml-zettel"

# Safer rm
alias rm="rm -i"

# Productivity / Code utils
alias mkscript="${HOME}/scripts/helpers/new_script.sh"
alias edal="$EDITOR $HOME/.bash_aliases"

# ------------------------------------------------------------
# Dotfiles git tools
alias dotf="/usr/bin/git --git-dir=$HOME/git/dots/my-symlinked-dotfiles/ --work-tree=$HOME $*"
alias ds="(cd $HOME; dotf status -u)"
alias dotlist="dotf ls-tree --full-tree --name-only -r HEAD"
alias dotdiff="dotf difftool"
alias dtn="(cd $HOME; dotf config --local status.showUntrackedFiles no)"
alias dty="(cd $HOME; dotf config --local status.showUntrackedFiles all)"
alias dotfaa=""
# Dotfile setup info/sources
# https://www.youtube.com/watch?v=tBoLDpTWVOM
# https://www.atlassian.com/git/tutorials/dotfiles
# ------------------------------------------------------------

# git aliases
alias gs="git status"
#alias gp="git pull"
alias undocommit="git reset --soft HEAD~1"
# alias gc="git checkout"
# alias gf="git fetch"

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

# Zettel
alias review="$HOME/scripts/zettel/weekly-review/weekly-review.sh"

# API outputs
alias tram="python $HOME/git/metrolink-next-tram/metrolink.py"
alias trams="watch -n 15 python $HOME/git/metrolink-next-tram/metrolink.py"

#### Mac and Linux specific
if [ "$IS_MACOS" ]
then
    if [ -f ~/.mac_aliases ]
    then
        . ~/.mac_aliases
    fi
else 
    #### General Linux Aliases
    # System
    alias sys="systemctl"
    alias j="journalctl -xe"

    ## Distro-specific
    if [ "$IS_ARCH_LINUX" ]
    then
        if [ -f ~/.arch_aliases ]
        then
            . ~/.arch_aliases
        fi
    fi
fi

