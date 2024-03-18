#!/bin/sh

# sudo curl -sS https://raw.githubusercontent.com/my-digital-life/stuff/main/setup.sh | bash
# set up the timezone
timedatectl set-timezone "America/Toronto"

# Remove snapd and ubuntu-advantage-tools
sudo apt -y purge ubuntu-advantage-tools snapd && sudo apt -y autoremove

# Update
sudo apt update
sudo apt -y dist-upgrade

# install SSH
if ! [ -x "$(command -v sshd)" ]; then
    echo "${Green}Install openssh-server.${Reset}"
    apt install -y openssh-server
    systemctl enable ssh
    systemctl start ssh
    echo "${Green}SSH installed.${Reset}"
else
    echo "${Green}openssh-server is already installed.${Reset}"

# config ssh
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config


