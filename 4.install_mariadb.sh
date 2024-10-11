#!/bin/bash

# Install MariaDB on Fedora 40 VM
ssh fedora-vm <<'EOF'
# Step 1: Install MariaDB
sudo yum install --yes mariadb-server mariadb

# Step 2: Enable and start MariaDB service
sudo systemctl enable --now mariadb

# Step 3: Run basic MariaDB secure installation
sudo mysql_secure_installation <<EOD
y
password  # Set root password
password  # Confirm root password
y         # Remove anonymous users
y         # Disallow root login remotely
y         # Remove test database
y         # Reload privilege tables
EOD

# Step 4: Create test database and user
mysql --user=root --password=password <<EOD
CREATE DATABASE testdb;
CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'testpass';
GRANT ALL PRIVILEGES ON testdb.* TO 'testuser'@'localhost';
FLUSH PRIVILEGES;
EOD
EOF
