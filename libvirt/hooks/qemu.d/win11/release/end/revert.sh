#!/bin/bash
# debug
set -x
  
# unload vfio modules
modprobe -r vfio_pci
modprobe -r vfio_iommu_type1
modprobe -r vfio

# rebind vt console
echo 1 > /sys/class/vtconsole/vtcon0/bind
echo 1 > /sys/class/vtconsole/vtcon1/bind

# rebind gpu
virsh nodedev-reattach pci_0000_06_00_1
virsh nodedev-reattach pci_0000_06_00_0

# reload gpu modules
modprobe amdgpu
modprobe gpu_sched
modprobe ttm
modprobe drm_kms_helper
modprobe drm_ttm_helper
modprobe i2c_algo_bit
modprobe drm

# restart sddm
systemctl start sddm.service
