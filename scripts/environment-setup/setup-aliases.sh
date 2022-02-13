#!/bin/bash
# Created on 2021-10-26 by Matt Lennon
# 
# Sets up my bash aliases
#

# Check if alias file exists

ALIAS_LOCATION="https://raw.githubusercontent.com/mattlennon3/dotfiles/desktop/.bash_aliases"

if [ -f "$HOME/.bash_aliases" ]; then
  echo "Existing alias file found, exiting..."
#  exit 1
fi

## TODO: In future, prompt for "do you want.. VPN aliases, virtual machine aliases etc". 
# Helpful to avoid these for work and keep things organised

## TODO: Sym link mac and linux alias files too

# Fetch my alias file from github

curl $ALIAS_LOCATION >> /tmp/.bash_aliases &> /dev/null

# Add alias import to .bashrc and .zshrc

if grep ".bash_aliases" ~/.zshrc &> /dev/null; then
  echo ".zshrc already pointing to alias file"
else
  ZSHRC="/tmp/.zshrc"
  # TODO: Start using printf https://stackoverflow.com/a/8467449/3033813
  echo "Linking alias file in .zshrc"
  echo "" >> $ZSHRC
  echo "# Personal Aliases" >> $ZSHRC 
  echo "if [ -f ~/.bash_aliases ]; then" >> $ZSHRC
  echo "  . ~/.bash_aliases" >> $ZSHRC
  echo "fi" >> $ZSHRC
  echo "" >> $ZSHRC
fi


