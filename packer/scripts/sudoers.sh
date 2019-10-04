#!/bin/bash

apt-get -y install sudo

# Set up password-less sudo for user admindebian
echo 'admindebian ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/admindebian
chmod 440 /etc/sudoers.d/admindebian

# no tty
echo "Defaults !requiretty" >> /etc/sudoers