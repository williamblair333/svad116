#!/bin/bash

# Install KVM hypervisor on Ubuntu VM
ssh ubuntu-vm <<'EOF'
# Step 1: Install KVM, libvirt, and related packages
sudo apt update
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager

# Step 2: Enable and start the libvirt service
sudo systemctl enable --now libvirtd

# Step 3: Verify KVM installation
sudo virsh list --all
EOF
