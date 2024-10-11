#!/bin/bash

# Setup NFS on Ubuntu 24 VM and mount it on Fedora 40 VM
ssh ubuntu-vm <<'EOF'
# Step 1: Install NFS server
sudo apt update
sudo apt install --yes nfs-kernel-server

# Step 2: Setup NFS shared directory
sudo mkdir --parents /var/nfs/general
sudo chown nobody:nogroup /var/nfs/general

# Step 3: Configure NFS export
echo "/var/nfs/general 192.168.122.0/24(rw,sync,no_subtree_check)" | sudo tee --append /etc/exports

# Step 4: Restart NFS server to apply changes
sudo exportfs --all
sudo systemctl restart nfs-kernel-server
EOF

# Step 5: Install and mount NFS share on Fedora 40 VM
ssh fedora-vm <<'EOF'
# Install NFS client
sudo yum install --yes nfs-utils

# Create a mount point
sudo mkdir --parents /mnt/nfs/general

# Mount the NFS share
sudo mount --types nfs 192.168.122.101:/var/nfs/general /mnt/nfs/general

# Add NFS mount to /etc/fstab for persistent mounting
echo "192.168.122.101:/var/nfs/general /mnt/nfs/general nfs defaults 0 0" | sudo tee --append /etc/fstab
EOF
