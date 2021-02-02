#!/bin/bash
# Created on 2020-12-31 by Matt Lennon
#

# https://wiki.archlinux.org/index.php/PCI_passthrough_via_OVMF#USB_controller

for usb_ctrl in /sys/bus/pci/devices/*/usb*; do pci_path=${usb_ctrl%/*}; iommu_group=$(readlink $pci_path/iommu_group); echo "Bus $(cat $usb_ctrl/busnum) --> ${pci_path##*/} (IOMMU group ${iommu_group##*/})"; lsusb -s ${usb_ctrl#*/usb}:; echo; done
  

