#!/bin/bash
# Created on 2021-01-12 by Matt Lennon
#

if [ "$EUID" -ne 0 ]
then
  echo "Script must be ran as root"
  exit 1
fi

# Make sure drive is mounted
if [ ! -d /run/media/matt/linux-trailer/ ]
then
  echo "mounting linux-trailer"
  su -c 'udisksctl mount -b /dev/sdc2' - matt
  sleep 3
fi

# Disable screensaver
#su -c 'xset -d :0 s off; xset -d :0 -dpms;' - matt

# Setup networking (hack)
bash /home/matt/scripts/virt-manager/macvtap.sh
# Start VM
echo "starting VM..."
virsh start win10-gpu-passthrough

