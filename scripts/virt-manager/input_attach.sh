#!/bin/bash
# Created on 2021-01-08 by Matt Lennon
#

## Argument supresses notifications
if [ -z "$1" ]; then
  notify-send "Attaching devices to guest" -i /home/matt/Content/Icons/windows10.png
fi

# Echo "guest" on success for awesome
virsh --connect qemu:///system attach-device win10-gpu-passthrough /home/matt/scripts/virt-manager/xmls/qpad-keyboard.xml && echo "guest"


