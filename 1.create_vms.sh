#!/bin/bash

sudo mkdir -p /var/lib/libvirt/.cache/virt-manager
sudo chown -R libvirt-qemu:kvm /var/lib/libvirt/.cache

sudo chmod +x /media/bill
sudo chmod +x /media/bill/rootMX21
sudo chmod +x /media/bill/rootMX21/opt
sudo chmod +x /media/bill/rootMX21/opt/svad116

sudo chown -R libvirt-qemu:libvirt-qemu /media/bill/rootMX21/opt/svad116

# Variables
VM_UBUNTU="ubuntu-vm"
VM_FEDORA="fedora-vm"
VM_RAM="2048"  # 2GB RAM
VM_CPU="2"     # 2 CPU cores
VM_DISK_SIZE="20"  # 20GB Disk size

# URLs for ISO files
UBUNTU_ISO_URL="https://releases.ubuntu.com/24.04.1/ubuntu-24.04.1-live-server-amd64.iso?_gl=1*eoxg5d*_gcl_au*NTE2MTI2MDU0LjE3Mjg2NDk4NDc."
FEDORA_ISO_URL="https://download.fedoraproject.org/pub/fedora/linux/releases/40/Server/x86_64/iso/Fedora-Server-dvd-x86_64-40-1.14.iso"

# Download ISO files
if [ ! -f ./ubuntu-24.04.1-live-server-amd64.iso ]; then
    sudo -u libvirt-qemu wget -O ./ubuntu-24.04.1-live-server-amd64.iso "$UBUNTU_ISO_URL"
fi

if [ ! -f ./Fedora-Server-dvd-x86_64-40-1.14.iso ]; then
    sudo -u libvirt-qemu wget -O ./Fedora-Server-dvd-x86_64-40-1.14.iso "$FEDORA_ISO_URL"
fi

sudo virt-install \
    --name "$VM_UBUNTU" \
    --memory "$VM_RAM" \
    --vcpus "$VM_CPU" \
    --disk path=./$VM_UBUNTU.qcow2,size=$VM_DISK_SIZE \
    --os-variant ubuntu23.04 \
    --network network=default \
    --graphics vnc,listen=0.0.0.0 \
    --console pty,target_type=serial \
    --cdrom ./ubuntu-24.04.1-live-server-amd64.iso


# Create Fedora 40 VM
sudo virt-install \
    --name "$VM_FEDORA" \
    --memory "$VM_RAM" \
    --vcpus "$VM_CPU" \
    --disk path=./$VM_FEDORA.qcow2,size=$VM_DISK_SIZE \
    --os-variant fedora-unknown \
    --network network=default \
    --graphics vnc,listen=0.0.0.0 \
    --console pty,target_type=serial \
    --cdrom ./Fedora-Server-dvd-x86_64-40-1.14.iso
