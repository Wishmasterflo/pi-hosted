#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

echo "Creating directories..."
sudo mkdir -p /portainer/Config/fmdserver || error "Failed to create certs directory!"
sudo mkdir -p /portainer/Config/fmdserver/db || error "Failed to create media directory!"
sudo mkdir -p /portainer/Config/fmdserver/web || error "Failed to create media directory!"

echo "Setting permissions..."
sudo chown -R 1000:1000 /portainer/Config/fmdserver || error "Failed to set permissions for Authentik certs!"
sudo chown -R 1000:1000 /portainer/Config/fmdserver/db || error "Failed to set permissions for Authentik media!"
sudo chown -R 1000:1000 /portainer/Config/fmdserver/web || error "Failed to set permissions for Authentik geoip!"
echo " "
echo "Copying fmsserver Config file..."
cp fmdserver_config.yml /portainer/Config/fmdserver/config.yml
echo "Done!"
echo "Edit the Config file in /portainer/Config/fmdserver/config.yml and restart the fmd-server afterwards!"
