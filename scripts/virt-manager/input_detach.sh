#!/bin/bash
# Created on 2021-01-08 by Matt Lennon
#

notify-send "Detaching from guest" -i /home/matt/Content/Icons/iconfinder_linux_tux.png

virsh --connect qemu:///system detach-device win10-gpu-passthrough /home/matt/scripts/virt-manager/xmls/qpad-keyboard.xml



