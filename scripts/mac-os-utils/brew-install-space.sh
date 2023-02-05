#!/bin/bash
# Created on 2022-05-11 by Matt Lennon
#

# https://stackoverflow.com/a/64041990/3033813

brew list --formula | xargs -n1 -P8 -I {} \
    sh -c "brew info {} | egrep '[0-9]* files, ' | sed 's/^.*[0-9]* files, \(.*\)).*$/{} \1/'" | \
    sort -h -r -k2 - | column -t

