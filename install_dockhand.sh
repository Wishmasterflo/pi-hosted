#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

function check_internet() {
  printf "Checking if you are online..."
  wget -q --spider http://github.com
  if [ $? -eq 0 ]; then
    echo "Online. Continuing."
  else
    error "Offline. Go connect to the internet then run the script again."
  fi
}

check_internet

sudo mkdir -p /portainer/Config/dockhand || error "Failed to create the Portainer Config Folder"

sudo docker pull fnsys/dockhand:latest || error "Failed to pull latest Portainer docker image!"
sudo docker run -d -p 3003:3000 --name=dockhand --restart=unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v /portainer/Config/dockhand:/app/data fnsys/dockhand:latest || error "Failed to run Dockhand docker image!"
