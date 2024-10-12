#!/bin/bash

#sudo apt update
#sudo apt install qemu-guest-agent -y


# Variables
USER="bill"  # Replace with your actual username
SSH_CONFIG="$HOME/.ssh/config"
VM_UBUNTU="ubuntu-vm"
VM_FEDORA="fedora-vm"

# Step 1: Check if SSH Key Exists
if [ ! -f ~/.ssh/id_rsa ]; then
    echo "SSH key not found. Generating a new SSH key..."
    ssh-keygen --type rsa --bits 4096 --file ~/.ssh/id_rsa --passphrase ""
else
    echo "SSH key already exists. Skipping SSH key generation."
fi
echo "Step 1 complete. Press Enter to continue."
read

# Step 2: Get IP addresses of VMs
echo "Retrieving IP addresses of the VMs..."
IP_UBUNTU="192.168.122.135"
IP_FEDORA="192.168.122.167"

if [[ -z "$IP_UBUNTU" || -z "$IP_FEDORA" ]]; then
    echo "Error: Could not determine IP addresses for the VMs. Make sure guest tools are installed."
    exit 1
else
    echo "IP address of Ubuntu VM: $IP_UBUNTU"
    echo "IP address of Fedora VM: $IP_FEDORA"
fi
echo "Step 2 complete. Press Enter to continue."
read

# Step 3: Copy SSH Key to VMs for Passwordless SSH
echo "Copying SSH key to Ubuntu VM ($IP_UBUNTU)..."
ssh-copy-id $USER@$IP_UBUNTU
echo "Copying SSH key to Fedora VM ($IP_FEDORA)..."
ssh-copy-id $USER@$IP_FEDORA
echo "Step 3 complete. Press Enter to continue."
read

# Step 4: Setup SSH Config using Heredoc
echo "Setting up SSH config for easy access to VMs..."
cat <<EOF >> $SSH_CONFIG
Host $VM_UBUNTU
    HostName $IP_UBUNTU
    User $USER
    IdentityFile ~/.ssh/id_rsa
    StrictHostKeyChecking no

Host $VM_FEDORA
    HostName $IP_FEDORA
    User $USER
    IdentityFile ~/.ssh/id_rsa
    StrictHostKeyChecking no
EOF
echo "Step 4 complete. Press Enter to finish."
read
