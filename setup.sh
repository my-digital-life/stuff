#!/bin/sh
# sudo curl -sS 
# set up the timezone
timedatectl set-timezone "America/Toronto"
fi

# Remove snapd and ubuntu-advantage-tools
sudo apt -y purge ubuntu-advantage-tools snapd && sudo apt -y autoremove

# Update
sudo apt update
sudo apt -y dist-upgrade
fi

# install SSH
if ! [ -x "$(command -v sshd)" ]; then
    echo "${Green}Install openssh-server.${Reset}"
    apt install -y openssh-server
    systemctl enable ssh
    systemctl start ssh
    echo "${Green}SSH installed.${Reset}"
else
    echo "${Green}openssh-server is already installed.${Reset}"
fi
# config ssh
$ sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
fi

