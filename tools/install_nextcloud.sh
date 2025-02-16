#!/bin/bash

function error {
    echo -e "\\e[91m$1\\e[39m"
    exit 1
}

echo "Creating directory..."
sudo mkdir -p /portainer/Config/Nextcloud/Config || error "Failed to create Config folder!"
sudo mkdir -p /portainer/Config/Nextcloud/Data || error "Failed to create Data folder!"
sudo mkdir -p /portainer/Config/Nextcloud/DB || error "Failed to create DB folder!"
sudo chown -R 1000:1000 /portainer/Config/Nextcloud || error "Failed set permission Nextloud folder!"
echo "Setup complete. You can now install Nextcloud using the App Template. This script specified for Nextcloud stack"
