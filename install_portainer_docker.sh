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

sudo mkdir -p /portainer/Config/portainer || error "Failed to create the Portainer Config Folder"

sudo docker pull portainer/portainer-ce:latest || error "Failed to pull latest Portainer docker image!"
sudo docker run -d -p 9443:9443 --name=portainer --restart=unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v /portainer/Config/portainer:/data portainer/portainer-ce:latest --logo "https://raw.githubusercontent.com/Wishmasterflo/pi-hosted/master/images/pi-hosted-logo.png" || error "Failed to run Portainer docker image!"

echo "Setting DOCKER_MIN_API_VERSION..."
sudo mkdir /etc/systemd/system/docker.service.d
sudo cat > /etc/systemd/system/docker.service.d/override.conf<< EOF
[Service]
Environment=DOCKER_MIN_API_VERSION=1.24
EOF
