#!/bin/bash

# Step 1: Install Nginx on Fedora 40
ssh fedora-vm <<'EOF'
sudo dnf install nginx

# Enable and start Nginx service
sudo systemctl enable --now nginx
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

EOF
