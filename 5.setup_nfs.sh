#!/bin/bash

# Setup NFS on Ubuntu 24 VM and mount it on Fedora 40 VM

# Step 1: Setup NFS Server on Ubuntu VM
ssh ubuntu-vm <<'EOF'
# Update package index and install NFS server
sudo apt update
sudo apt install --yes nfs-kernel-server

# Step 2: Setup NFS shared directory
sudo mkdir --parents /var/nfs/general
sudo chown nobody:nogroup /var/nfs/general

# Step 3: Configure NFS export
echo "/var/nfs/general 192.168.122.0/24(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports

# Step 4: Restart NFS server to apply changes
sudo exportfs -a
sudo systemctl restart nfs-kernel-server
EOF

echo "NFS server setup on Ubuntu completed. Press Enter to proceed to Fedora client setup."
read

# Step 5: Install and mount NFS share on Fedora VM
ssh fedora-vm <<'EOF'
# Install NFS client
sudo dnf install -y nfs-utils

# Step 6: Create a mount point and mount the NFS share
sudo mkdir --parents /mnt/nfs/general
sudo mount --types nfs 192.168.122.135:/var/nfs/general /mnt/nfs/general

# Step 7: Add NFS mount to /etc/fstab for persistent mounting
echo "192.168.122.101:/var/nfs/general /mnt/nfs/general nfs defaults 0 0" | sudo tee -a /etc/fstab
EOF

echo "NFS client setup on Fedora completed."
