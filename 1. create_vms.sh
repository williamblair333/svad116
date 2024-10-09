#!/bin/bash

# Variables
VM_UBUNTU="ubuntu-vm"
VM_CENTOS="centos-vm"
VM_RAM="2048"  # 2GB RAM
VM_CPU="2"     # 2 CPU cores
VM_DISK_SIZE="20G"  # 20GB Disk size

# Create Ubuntu VM
virt-install \
    --name $VM_UBUNTU \
    --ram $VM_RAM \
    --vcpus $VM_CPU \
    --disk size=$VM_DISK_SIZE \
    --os-type linux \
    --os-variant ubuntu22.04 \
    --network default \
    --graphics none \
    --console pty,target_type=serial \
    --location 'http://archive.ubuntu.com/ubuntu/dists/jammy/main/installer-amd64/' \
    --extra-args 'console=ttyS0,115200n8 serial'

# Create CentOS VM
virt-install \
    --name $VM_CENTOS \
    --ram $VM_RAM \
    --vcpus $VM_CPU \
    --disk size=$VM_DISK_SIZE \
    --os-type linux \
    --os-variant centos7.0 \
    --network default \
    --graphics none \
    --console pty,target_type=serial \
    --location 'http://mirror.centos.org/centos/7/os/x86_64/' \
    --extra-args 'console=ttyS0,115200n8 serial'
