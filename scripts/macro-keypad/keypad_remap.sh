#!/bin/bash
# Created on 2021-01-23 by Matt Lennon
#

export DISPLAY=$(cat /tmp/x-vars/display)
export HOME=$(cat /tmp/x-vars/home)
export XAUTHORITY=$(cat /tmp/x-vars/xauthority)

xmodmap $HOME/.Xmodmap

notify-send "Reset keypad binds"

