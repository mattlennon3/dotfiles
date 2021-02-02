#!/bin/bash
# Created on 2021-02-02 by Matt Lennon
# 
# https://www.libvirt.org/hooks.html
# 
# This file lives in hooks/qemu
## ln -s $HOME/scripts/virt-manager/vm-events.sh /etc/libvirt/hooks/qemu

# x vars
export DISPLAY=$(cat /tmp/x-vars/display)
export HOME=$(cat /tmp/x-vars/home)
export XAUTHORITY=$(cat /tmp/x-vars/xauthority)

## Before a QEMU guest is started, the qemu hook script is called
## Occurs after the QEMU process has successfully started up:
# /etc/libvirt/hooks/qemu guest_name started begin -

if [[ $2 == "started" ]];
then
  echo "Disabling screen lock & dpms" | systemd-cat
  xset s off 
  xset -dpms
fi

## When a QEMU guest is stopped, the qemu hook script is called
## Then, after libvirt has released all resources:
# /etc/libvirt/hooks/qemu guest_name release end -

if [[ $2 == "release" ]];
then
  echo "Enabling screen lock & dpms" | systemd-cat
  xset s on
  xset +dpms
fi

