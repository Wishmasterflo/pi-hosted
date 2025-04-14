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
echo " "
echo "Installing Portainer..."
systemctl --user enable --now podman.socket
sudo mkdir -p /portainer/Config/portainer || error "Failed to create the Portainer Config Folder"
chown flo:flo /portainer/Config/portainer
podman run -d -p 9443:9443 --pid=host --privileged --name portainer --restart=unless-stopped -v /run/user/$UID/podman/podman.sock:/var/run/docker.sock:Z -v /portainer/Config/portainer:/data docker.io/portainer/portainer-ce:latest
export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
systemctl --user start --now podman.socket
systemctl --user status --now podman.socket
echo " "
podman ps -all
echo " "
mkdir -p ~/.config/systemd/user
cd $_
podman generate systemd --new --name --files portainer
systemctl --user daemon-reload
systemctl --user enable --now container-portainer
systemctl --user status container-portainer
systemctl --user enable podman-restart.service
sudo loginctl enable-linger $USER
echo " "
echo "Portainer Installation done!"


