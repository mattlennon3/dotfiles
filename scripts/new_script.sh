#!/bin/bash
# Rough template for a script with my name & date on it.
# Could do with adding a line for license

base=$'#!/bin/bash\n'

date=$(date +%F)
author=$"# Created on ${date} by Matt Lennon"
trail=$'\n#'

scriptContents="${base}${author}${trail}"

if [ -z "$1" ]
then
      echo "Error: Missing script name"
else
      echo "${scriptContents}" > $1
fi
