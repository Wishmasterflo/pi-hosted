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

curl -sSL https://get.docker.com | sh || error "Failed to install Docker."
sudo usermod -aG docker $USER || error "Failed to add user to the Docker usergroup."
echo "Setting DOCKER_MIN_API_VERSION..."
sudo mkdir /etc/systemd/system/docker.service.d
cat > /etc/systemd/system/docker.service.d/override.conf<< EOF
[Service]
Environment=DOCKER_MIN_API_VERSION=1.24
EOF

echo "Remember to logoff/reboot for the changes to take effect."
