#!/bin/bash
# Created on 2021-01-31 by Matt Lennon
#
# Saves the x vars into files, some scripts don't have them
# 

XVARSFILE="/tmp/x-vars"

mkdir -p $XVARSFILE;

echo $DISPLAY > "$XVARSFILE/display"
echo $HOME > "$XVARSFILE/home"
echo $XAUTHORITY > "$XVARSFILE/xauthority"

