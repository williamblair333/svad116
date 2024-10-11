#!/bin/bash

# Step 1: Install Nginx on Fedora 40
ssh fedora-vm <<'EOF'
sudo yum install --yes epel-release
sudo yum install --yes nginx

# Enable and start Nginx service
sudo systemctl enable --now nginx
EOF

