#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

echo "Creating directories..."
sudo mkdir -p /portainer/Config/friendica || error "Failed to create certs directory!"

echo "Setting permissions..."
sudo chown -R 1000:1000 /portainer/Config/friendica || error "Failed to set permissions for Friendica!"
echo "Done."
