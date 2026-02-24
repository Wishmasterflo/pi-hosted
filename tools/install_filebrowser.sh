#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

echo "Creating directories..."
sudo mkdir -p /portainer/Config/filebrowser || error "Failed to create certs directory!"
sudo mkdir -p /portainer/Config/filebrowser/config || error "Failed to create certs directory!"
sudo mkdir -p /portainer/Config/filebrowser/db || error "Failed to create certs directory!"

echo "Setting permissions..."
sudo chown -R 1000:1000 /portainer/Config/filebrowser
sudo chown -R 1000:1000 /portainer/Config/filebrowser/config
sudo chown -R 1000:1000 /portainer/Config/filebrowser/db
echo " "
echo "Done! You can go ahead and install Filebrowser from the app template now."
