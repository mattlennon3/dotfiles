#!/bin/bash
# Created on 2021-01-08 by Matt Lennon
#

## Argument supresses notifications
if [ -z "$1" ]; then
  notify-send "Detaching from guest" -i /home/matt/Content/Icons/iconfinder_linux_tux.png
fi

# Echo "host" on success for awesome
virsh --connect qemu:///system detach-device win10-gpu-passthrough /home/matt/scripts/virt-manager/xmls/qpad-keyboard.xml && echo "host"



