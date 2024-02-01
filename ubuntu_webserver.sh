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

# Set up UFW (Uncomplicated Firewall) and allow only traffic on ports 80 and 443
sudo apt install -y ufw
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable

# Display status and information
sudo ufw status verbosey

# Display installed versions
echo "Node.js version:"
node --version

echo "npm version:"
npm --version

echo "Docker version:"
docker --version
