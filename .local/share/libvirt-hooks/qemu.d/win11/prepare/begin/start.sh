#!/bin/bash

# for debugging
set -x

# stop sddm
systemctl stop sddm.service

# unbind vt console
echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

# avoid race condition
sleep 10

# unload gpu modules
modprobe -r amdgpu
modprobe -r gpu_sched
modprobe -r ttm
modprobe -r drm_kms_helper
modprobe -r drm_ttm_helper
modprobe -r i2c_algo_bit
modprobe -r drm

# unbind gpu
virsh nodedev-detach pci_0000_06_00_0
virsh nodedev-detach pci_0000_06_00_1

# load vfio modules
modprobe vfio
modprobe vfio-pci
modprobe vfio_iommu_type1
