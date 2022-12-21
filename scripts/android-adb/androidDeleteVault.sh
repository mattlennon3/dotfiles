#!/bin/bash
# Created by: Matthew Lennon
# Date: 9/10/2022
#
# This script automates the process of connecting to an android device and deleting the zettel vault from within
#

VAULT_MOBILE_DIR="/storage/emulated/0/git/Zettel-Mob/Zettel-Mob/*"

main() {
  # Find what state the phone connection is in
  # TODO expand this awk command with the intention of merging these two variables into a boolean
  AUTHORISED_OUTPUT=$(adb devices | tail +2 | grep "device" | awk '{print $1;}');
  UNAUTHORISED_OUTPUT=$(adb devices | tail +2 | grep "unauthorized" | awk '{print $1;}');

  if [ -n "$AUTHORISED_OUTPUT" ]; then 
    echo "Found android device: ${AUTHORISED_OUTPUT}"
    echo ""
    echo "Mobile vault dir: " $VAULT_MOBILE_DIR

    echo "===WARNING==="
    echo "THIS WILL DELETE ALL VAULT DATA"
    echo "===WARNING==="
    while true; do
      read -p "Do you want to remove all files in the phone vault? y/n? " yn
      case $yn in
          [Yy]* ) echo "Removing..."; break;;
          [Nn]* ) exit 1;;
          * ) echo "Please answer yes or no.";;
      esac
    done

    adb shell rm $VAULT_MOBILE_DIR

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
