#!/bin/bash
echo "Starting the script with user: $USER and sudo user: $SUDO_USER"

# Update and upgrade packages
sudo apt update
sudo apt upgrade -y

# Install Node.js and npm
sudo apt install -y nodejs npm

# Install Docker
sudo apt install -y docker.io

# Add the user to the docker group to avoid using sudo with docker commands
sudo usermod -aG docker $SUDO_USER

# Linux post-installation steps for Docker (optional but recommended)
sudo systemctl enable docker
sudo systemctl start docker

# install vscode
sudo apt install -y code

# get confirmation to install JetBrains Toolbox
read -p "Do you want to install JetBrains Toolbox? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # install JetBrains Toolbox
    sudo snap install jetbrains-toolbox --classic
fi



