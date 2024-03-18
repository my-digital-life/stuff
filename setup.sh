#!/bin/sh

# sudo curl -sS https://raw.githubusercontent.com/my-digital-life/stuff/main/setup.sh | bash
# set up the timezone
sudo timedatectl set-timezone "America/Toronto"

# Upgrade
sudo apt update && sudo apt -y dist-upgrade

# install SSH
sudo apt -y install ssh openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh

# config ssh
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config


