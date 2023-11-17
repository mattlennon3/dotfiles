## Setup ##

IS_MACOS=$(command -v sw_vers && sw_vers | grep macOS 2> /dev/null)
IS_ARCH_LINUX=$(uname -a | grep "m-arch" 2> /dev/null)

##### Aliases #####
# ls aliases
alias l='ls -oAthF | head && echo "..."' # short output of 10 recent items
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
# Rebind nvim to hx as I'll keep forgetting
alias nvim="hx"

# Productivity / Code utils
alias mkscript="${HOME}/scripts/helpers/new_script.sh"
alias edal="$EDITOR $HOME/.bash_aliases"
alias realias="source $HOME/.bash_aliases"

# ------------------------------------------------------------
# Dotfiles git tools
dotf() {
  /usr/bin/git --git-dir=$HOME/git/dots/my-symlinked-dotfiles/ --work-tree=$HOME "$@"
}
dotlisto () {
  if [[ $PWD != $HOME ]]; then
    dotf ls-files --others
  else
    echo "Can't run in home directory!"
  fi
}
# Wrap git so if I run it in $HOME it aliases to dotf
#git () {
#  if [ "$PWD" == "$HOME" ]; then
#    echo "Woops, git ran in \$HOME directory, running in dotfile context"
#    dotf "$@"
#  else
#    /usr/bin/git "$@"
#  fi
#}
# This no longer works on my mac. ChatGPT guided me to write the function above. Crazy times
#alias dotf="/usr/bin/git --git-dir=$HOME/git/dots/my-symlinked-dotfiles/ --work-tree=$HOME $*"
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
alias cdwr="cd $HOME/git/ts-weekly-review"

# Work shortcuts
alias checkapp="npm i; npm run typecheck; npm run test"

# API outputs
alias tram="python $HOME/git/metrolink-next-tram/metrolink.py"
alias trams="watch -n 15 python $HOME/git/metrolink-next-tram/metrolink.py"

# Random Stuff
# no-more-secrets
alias nms="nms -a -f green"

#### Mac and Linux specific
if [ "$IS_MACOS" ]
then
    # CD Aliases
	alias cdmc="cd $HOME/Library/Application\ Support/minecraft"
	
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

