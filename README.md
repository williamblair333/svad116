# SVAD 116 Final Project - Virtual Machines Setup

## Overview
This repository contains scripts to set up two virtual machines (Ubuntu 24 and Fedora 40), install required services, and demonstrate NFS sharing and a LAMP stack using Nginx and MariaDB. The steps are broken into individual scripts for clarity.

## Prerequisites
- Virt-manager and related tools for virtual machine creation.
- SSH access configured between your host and the VMs.

## Scripts

### 0. `install_kvm.sh`
This script turns the host into a VM server which can be administered via virt-manager or the CLI using virsh:

### 1. `create_vms.sh`
This script creates two VMs:
- **Ubuntu 24 VM** (`ubuntu-vm`)
- **Fedora 40 VM** (`fedora-vm`)

### 2. setup_ssh.sh
This script sets up SSH key-based authentication and appends the configuration to your SSH config file for passwordless SSH access to the VMs.

### 3. install_nginx.sh
This script installs Nginx on the Fedora 40 VM and starts the Nginx service.

### 4. install_mariadb.sh
This script installs MariaDB on the Fedora 40 VM, runs a secure installation, and creates a test database with a user.

### 5. setup_nfs.sh
This script sets up an NFS server on the Ubuntu 24 VM and mounts the NFS share on the Fedora 40 VM.

## Demonstration Guide

    Install KVM on host:
        Run install_kvm.sh.
    Create the VMs:
        Run create_vms.sh to set up both VMs.
    Setup SSH:
        Run setup_ssh.sh to enable passwordless SSH access.
    Install Nginx:
        Run install_nginx.sh to install and start Nginx on the Fedora 40 VM.
    Install MariaDB:
        Run install_mariadb.sh to install MariaDB and create a test database.
    Setup NFS:
        Run setup_nfs.sh to configure NFS on Ubuntu 24 and mount it on Fedora 40.

## Video Recording Instructions

While recording the demonstration, perform the following:

    Show that the VMs are running.
    SSH into both VMs.
    On the Ubuntu 24 VM, demonstrate mounting the NFS share and setting up KVM.
    On the Fedora 40 VM, show Nginx running and perform a database query using MariaDB.

## Lessons Learned

    Document any lessons learned during the setup process here.
