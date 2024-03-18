#!/bin/sh

# sudo curl -sS https://raw.githubusercontent.com/my-digital-life/stuff/main/setup.sh | bash
# set up the timezone
timedatectl set-timezone "America/Toronto"

# Update
apt update
# Remove snapd and ubuntu-advantage-tools
apt -y purge ubuntu-advantage-tools snapd && sudo apt -y autoremove
# upgrade
apt -y dist-upgrade

# install SSH
apt -y install ssh openssh-server
systemctl enable ssh
systemctl start ssh

# config ssh
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config


