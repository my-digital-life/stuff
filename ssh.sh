#!/bin/sh

# # Echoes all commands before executing.
set -o verbose

# setup ssh
# sudo curl -sS https://raw.githubusercontent.com/my-digital-life/stuff/main/ssh.sh | bash
# set timezone, I don't want time to screw up https
sudo timedatectl set-timezone "America/Toronto"

# Upgrade
sudo apt update && sudo apt -y dist-upgrade

# install SSH
sudo apt -y install ssh openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh

# config ssh
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config


