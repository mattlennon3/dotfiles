#!/bin/bash

sleep 1
## https://superuser.com/a/350336/1177092
# Hack to set my xmodmap binds when the keyboard switches between the guest virtual machine & the host
# rules file goes here:
# /etc/udev/rules.d/00-usb-keyboards.rules

export DISPLAY=$(cat /tmp/x-vars/display)
export HOME=$(cat /tmp/x-vars/home)
export XAUTHORITY=$(cat /tmp/x-vars/xauthority)

xmodmap $HOME/.Xmodmap

