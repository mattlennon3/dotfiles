#!/bin/bash
# Created on 2021-11-27 by Matt Lennon
# 
# Mounts a hard drive from the w10 VM
# must be a .qcow2 file
# https://wiki.archlinux.org/title/QEMU#Mounting_a_partition_from_a_qcow2_image
#

DEFAULT_FILE_PATH="/run/media/matt/TET/VM-Windows-HDD/win10-secondary.qcow2"

FILE_PATH=${1:-$DEFAULT_FILE_PATH}
PARTITION=${1:-"p2"}

# Check file exists
if [ ! -f "$FILE_PATH" ]
then
  echo "File doesn't exist"
  exit 1
fi

if [ "$EUID" -ne 0 ]
then
  echo "Script must be ran as root"
  exit 1
fi

if [ -f "/dev/nbd0" ]
then
  echo "/dev/nbd0 exists, is there another drive mounted?"
  exit 1
fi

#exit 0

# Insert kernel module (network block device)
modprobe nbd max_part=16

sleep 1

# Share disk and create entry in /dev
qemu-nbd -c /dev/nbd0 $FILE_PATH 

sleep 1

# Discover partitions
partprobe /dev/nbd0

# Mount partition
echo "Attempting to mount partition /dev/nbd0$PARTIION"
su -c "udisksctl mount -b /dev/nbd0$PARTITION" - matt

