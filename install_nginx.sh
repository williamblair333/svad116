#!/bin/bash

# Step 1: Install Nginx on CentOS
ssh centos-vm <<'EOF'
sudo yum install -y epel-release
sudo yum install -y nginx

# Enable and start Nginx service
sudo systemctl enable --now nginx
EOF
