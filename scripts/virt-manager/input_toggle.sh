#!/bin/bash
# Created on 2021-01-23 by Matt Lennon
#

if virsh --connect qemu:///system list | grep -q "win10-gpu-passthrough" 
then
    # notify-send "VM running" -i "/home/matt/Content/Icons/iconfinder_check_1930264.png"   
    if  virsh --connect qemu:///system dumpxml win10-gpu-passthrough | 
        grep -A 1 -E "vendor id='0x0665'" | # Check if the vendor ID exists and get the next line
        grep -q -E "product id='0x6000'" # If the product id also matches, keyboard found
    then
        ## Awesome passes arg to this script (supresses notifications)
        bash /home/matt/scripts/virt-manager/input_detach.sh $1
    else
        ## Awesome passes arg to this script (supresses notifications)
        bash /home/matt/scripts/virt-manager/input_attach.sh $1
    fi

else
    notify-send "VM not running" -i "/home/matt/Content/Icons/iconfinder_simpline_48_2305614.png"
fi

