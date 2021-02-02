#!/bin/bash
# Created on 2020-12-31 by Matt Lennon
#

# https://wiki.archlinux.org/index.php/PCI_passthrough_via_OVMF#Ensuring_that_the_groups_are_valid
shopt -s nullglob
for g in `find /sys/kernel/iommu_groups/* -maxdepth 0 -type d | sort -V`; do
      echo "IOMMU Group ${g##*/}:"
          for d in $g/devices/*; do
                    echo -e "\t$(lspci -nns ${d##*/})"
                        done;
                      done;

