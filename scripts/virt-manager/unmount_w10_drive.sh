#!/bin/bash
# Created on 2021-11-27 by Matt Lennon
#
# Unmount drive

PARTITION=${1:-"p2"}

if [ "$EUID" -ne 0 ]
then
  echo "Script must be ran as root"
  exit 1
fi

echo "Attempting to unmount /dev/nbd0$PARTITION"
su -c "udisksctl unmount -b /dev/nbd0$PARTITION" - matt || echo sudo fdisk -l | grep "nbd"

echo "Removing nbd drive from /dev"
qemu-nbd -d /dev/nbd0


