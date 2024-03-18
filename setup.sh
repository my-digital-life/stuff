#!/bin/sh

# sudo curl -sS https://raw.githubusercontent.com/my-digital-life/stuff/main/setup.sh | bash
# set up the timezone
sudo timedatectl set-timezone "America/Toronto"

# Update
sudo apt update
# Remove snapd and ubuntu-advantage-tools
sudo apt -y purge ubuntu-advantage-tools snapd && sudo apt -y autoremove
# upgrade
sudo apt -y dist-upgrade

# install SSH
sudo apt -y install ssh openssh-server
systemctl enable ssh
systemctl start ssh

# config ssh
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config


