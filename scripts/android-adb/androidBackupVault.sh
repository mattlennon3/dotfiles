#!/bin/bash
# Created by: Matthew Lennon
# Date: 16/07/2022
#
# This script automates the process of connecting to an android device and copying the zettel vault from within
#

VAULT_MOBILE_DIR="/storage/emulated/0/git/Zettel-Mob/Zettel-Mob/"
VAULT_MAC_UNSORTED_MOB_DIR="/Users/matt-dev/vaults/personal/ml-zettel/Unsorted-Mobile"

main() {
  # Find what state the phone connection is in
  # TODO expand this awk command with the intention of merging these two variables into a boolean
  AUTHORISED_OUTPUT=$(adb devices | tail +2 | grep "device" | awk '{print $1;}');
  UNAUTHORISED_OUTPUT=$(adb devices | tail +2 | grep "unauthorized" | awk '{print $1;}');

  if [ -n "$AUTHORISED_OUTPUT" ]; then 
    echo "Found android device: ${AUTHORISED_OUTPUT}"
    echo ""

    # https://superuser.com/a/352290
    if [ -d "$VAULT_MAC_UNSORTED_MOB_DIR" ] && [ -z "$(ls -A "$VAULT_MAC_UNSORTED_MOB_DIR")" ]; then
      # do nothing
      echo "Local vault Unsorted-Mobile/ ready for backup"
      echo ""
    else
      if [ -n "$(ls -A "$VAULT_MAC_UNSORTED_MOB_DIR")" ]; then
        echo "Local vault Unsorted-Mobile/ is not empty"
      else
        echo "Local vault Unsorted-Mobile/ directory does not exist"
      fi
      exit 1
    fi
    echo ""
    echo "Mobile vault dir: " $VAULT_MOBILE_DIR
    echo "Local backup dir: " $VAULT_MAC_UNSORTED_MOB_DIR

    while true; do
      read -p "Do you want to initiate the backup? y/n? " yn
      case $yn in
          [Yy]* ) echo "Backing up..."; break;;
          [Nn]* ) exit 1;;
          * ) echo "Please answer yes or no.";;
      esac
    done

    adb pull $VAULT_MOBILE_DIR $VAULT_MAC_UNSORTED_MOB_DIR

    echo "Backup complete"

    exit 0

  elif [ -n "$UNAUTHORISED_OUTPUT" ]; then 
    echo "Found unauthorized android device: ${UNAUTHORISED_OUTPUT}"
    echo "Allow USB debugging on the device to continue"
  else
    echo "No android devices found"
  fi
}

while true
do
  clear # TODO: Make less "blinky" when running (more like the watch command)
  main
  sleep 2
done
