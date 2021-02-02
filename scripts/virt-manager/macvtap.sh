#!/bin/bash

if [ "$EUID" -ne 0 ]
then
  echo "Script must be ran as root"
  exit 1
fi

if ip link list | grep -q 'macvtap';
then
  echo "macvtap network passthrough exists";
  # ip link delete macvtap0 type macvtap
else
  echo "Adding macvtap network passthrough"
  ip link add link enp7s0 name macvtap0 type macvtap
  ip link set macvtap0 address fa:f6:79:8c:e8:c0 up
  echo "macvtap enabled"
fi
