# SVAD 116 Final Project - Virtual Machines Setup

## Overview
This repository contains scripts to set up two virtual machines (Ubuntu and CentOS 7), install required services, and demonstrate NFS sharing and a LAMP stack using Nginx and MariaDB. The steps are broken into individual scripts for clarity.

## Prerequisites
- Virt-manager and related tools for virtual machine creation.
- SSH access configured between your host and the VMs.

## Scripts

### 1. `create_vms.sh`
This script creates two VMs:
- **Ubuntu VM** (`ubuntu-vm`)
- **CentOS VM** (`centos-vm`)

#### Usage:
```bash
./create_vms.sh

2. setup_ssh.sh

This script sets up SSH key-based authentication and appends the configuration to your SSH config file for passwordless SSH access to the VMs.
Usage:

bash

./setup_ssh.sh

3. install_nginx.sh

This script installs Nginx on the CentOS VM and starts the Nginx service.
Usage:

bash

./install_nginx.sh

4. install_mariadb.sh

This script installs MariaDB on the CentOS VM, runs a secure installation, and creates a test database with a user.
Usage:

bash

./install_mariadb.sh

5. setup_nfs.sh

This script sets up an NFS server on the Ubuntu VM and mounts the NFS share on the CentOS VM.
Usage:

bash

./setup_nfs.sh

Demonstration Guide

    Create the VMs:
        Run create_vms.sh to set up both VMs.
    Setup SSH:
        Run setup_ssh.sh to enable passwordless SSH access.
    Install Nginx:
        Run install_nginx.sh to install and start Nginx on the CentOS VM.
    Install MariaDB:
        Run install_mariadb.sh to install MariaDB and create a test database.
    Setup NFS:
        Run setup_nfs.sh to configure NFS on Ubuntu and mount it on CentOS.

Video Recording Instructions

While recording the demonstration, perform the following:

    Show that the VMs are running.
    SSH into both VMs.
    On the Ubuntu VM, demonstrate mounting the NFS share and setting up KVM.
    On the CentOS VM, show Nginx running and perform a database query using MariaDB.

Lessons Learned

    Document any lessons learned during the setup process here.
