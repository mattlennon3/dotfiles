#!/bin/bash
# Created by: Matthew Lennon
# Date: 06/06/2022
#
# This script automates the process of reconnecting your app to metro after you plug in your android phone
# Usually you have to run "adb reverse tcp:8081 tcp:8081" and then restart your metro server
# This script should do that for you by waiting until the phone is authorised before recreating the metro server instance
#
# This script works best when it launches the original metro server, it will fail to properly close an existing one
#

CONNECTED_STATE="disconnected"

# REPO_DIR="$PWD"
REPO_DIR="/Users/matt-dev/git/mana/mobile-app"

start_metro() {
  osascript -e "tell app \"Terminal\" to do script \"(cd $REPO_DIR; yarn start); exit 0\""
}

kill_metro() {
  # Kill server first, so apple does not ask us "are you sure you want to close a terminal which is running a process"
  METRO_PID=$(lsof -i :8081 | awk '{if (NR!=1) {print $2}}')
  if [ -n "$METRO_PID" ]; then
    echo "Killing metro server with process: $METRO_PID..."
    kill -3 $METRO_PID
    echo "Server closed"
  fi
  # Close terminal window // TODO: Be more specific about the window, there could be other servers running with this command
  osascript<<EOF 
    tell application "Terminal" to close (every window whose name contains "yarn start")
    return
EOF
}

main() {
  # Find what state the phone connection is in
  # TODO expand this awk command with the intention of merging these two variables into a boolean
  AUTHORISED_OUTPUT=$(adb devices | tail +2 | grep "device" | awk '{print $1;}');
  UNAUTHORISED_OUTPUT=$(adb devices | tail +2 | grep "unauthorized" | awk '{print $1;}');

  if [ -n "$AUTHORISED_OUTPUT" ]; then 
    if [ $CONNECTED_STATE == "connected" ]; then
      echo "Device attached: $AUTHORISED_OUTPUT"
      return
    fi
    # Should only run once for a new connection
    echo "Found android device: ${AUTHORISED_OUTPUT}"
    echo "Connecting with adb reverse..."
    ADB_CONNECTION=$(adb reverse tcp:8081 tcp:8081);
    if [ $? -eq 0 ]; then
      echo "Connected to device"
      # We don't get a port output if this is ran again with an already connected device
      if [ -n "$ADB_CONNECTION" ]; then
        echo "Port: ${ADB_CONNECTION}"
        # Restart metro so it picks up the new port connection
        kill_metro
        sleep 3
        start_metro
        sleep 10
      fi
      CONNECTED_STATE="connected"
    else
      echo "Something went wrong when connecting..."
      echo $ADB_CONNECTION
      exit 1
    fi
  elif [ -n "$UNAUTHORISED_OUTPUT" ]; then 
    echo "Found unauthorized android device: ${UNAUTHORISED_OUTPUT}"
    echo "Allow USB debugging on the device to continue"
    CONNECTED_STATE="disconnected"
  else
    echo "No android devices found"
    CONNECTED_STATE="disconnected"
  fi
}

while true
do
  clear # TODO: Make less "blinky" when running (more like the watch command)
  main
  sleep 2
done
