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

echo "Creating directories..."
sudo mkdir -p /portainer/Config/eclipse-mosquitto/config || error "Failed to create config directory!"
sudo mkdir -p /portainer/Config/eclipse-mosquitto/data || error "Failed to create data directory!"
sudo mkdir -p /portainer/Config/eclipse-mosquitto/log || error "Failed to create log directory!"
echo "Downloading Eclipse Mosquitto MQTT config files if they don't exist"
if [ -d /portainer/Config/eclipse-mosquitto/config/mosquitto.conf ];
then
    echo "/portainer/Config/eclipse-mosquitto/config/mosquitto.conf is a directory removing"
    rm -rf '/portainer/Config/eclipse-mosquitto/config/mosquitto.conf/'
fi

if [ ! -f /portainer/Config/eclipse-mosquitto/config/mosquitto.conf ]; 
then
	sudo wget -O /portainer/Config/eclipse-mosquitto/config/mosquitto.conf https://raw.githubusercontent.com/pi-hosted/pi-hosted/master/configs/eclipse-mosquitto.conf || error "Failed to download mosquitto.conf file!"
fi
echo "Pre-install is complete"
