#!/bin/bash

# Variables
USER="bill"  # Replace with your actual username
SSH_CONFIG="$HOME/.ssh/config"
VM_UBUNTU="ubuntu-vm"
VM_CENTOS="centos-vm"

# Step 1: Generate SSH Key (if not already done)
if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen --type rsa --bits 4096 --file ~/.ssh/id_rsa -N ""
fi

# Step 2: Copy SSH Key to VMs for Passwordless SSH
ssh-copy-id $USER@$VM_UBUNTU
ssh-copy-id $USER@$VM_CENTOS

# Step 3: Setup SSH Config using Heredoc
cat <<EOF >> $SSH_CONFIG
Host $VM_UBUNTU
    HostName 192.168.122.101
    User $USER
    IdentityFile ~/.ssh/id_rsa
    StrictHostKeyChecking no

Host $VM_CENTOS
    HostName 192.168.122.102
    User $USER
    IdentityFile ~/.ssh/id_rsa
    StrictHostKeyChecking no
EOF
