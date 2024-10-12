#!/bin/bash

# Install MariaDB on Fedora 40 VM
ssh fedora-vm <<'EOF'
# Step 1: Install MariaDB
sudo dnf install -y mariadb-server mariadb

# Step 2: Enable and start MariaDB service
sudo systemctl enable --now mariadb

# Step 3: Set root password and secure installation
sudo mysql --user=root <<EOD
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('password');
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';
FLUSH PRIVILEGES;
EOD

# Step 4: Create test database and user
sudo mysql --user=root --password=password <<EOD
CREATE DATABASE testdb;
CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'testpass';
GRANT ALL PRIVILEGES ON testdb.* TO 'testuser'@'localhost';
FLUSH PRIVILEGES;
EOD
EOF

ssh fedora-vm <<'EOF'
sudo mysql -u root -p'password' <<EOD
USE testdb;
CREATE TABLE IF NOT EXISTS demo_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
INSERT INTO demo_table (name) VALUES ('John Doe'), ('Jane Doe'), ('Alice Wonderland');
SELECT * FROM demo_table;
EOD
EOF


ssh fedora-vm <<'EOF'
sudo mysql -u root -p'password' <<EOD
USE testdb;
SELECT * FROM demo_table;
EOD
EOF


