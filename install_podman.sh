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

echo "Setting execution permission for needed scripts..."
chmod +x install_podman.sh
chmod +x install_portainer_docker.sh
chmod +x update_portainer_docker.sh
chmod +x update_portainer_podman.sh
echo " "
echo "Installing Podman..."
sudo apt install podman -y
echo " "
echo "Installing Podman-Compose..."
sudo apt install podman-compose -y
echo " "
echo "Installation done. Please reboot the system!"
podman --version
