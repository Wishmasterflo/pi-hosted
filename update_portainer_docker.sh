#!/bin/bash


function error() {
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
 
portainer_pid=`docker ps | grep portainer-ce | awk '{print $1}'`
portainer_name=`docker ps | grep portainer-ce | awk '{print $2}'`
 
sudo docker stop $portainer_pid || error "Failed to stop portainer!"
sudo docker rm $portainer_pid || error "Failed to remove portainer container!"
sudo docker rmi $portainer_name || error "Failed to remove/untag images from the container!"
sudo mkdir -p /portainer/Config/portainer || error "Failed to create the Portainer Config Folder"
sudo docker run -d -p 9443:9443 --name=portainer --restart=unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v /portainer/Config/portainer:/data portainer/portainer-ce:latest --logo "https://pi-hosted.com/pi-hosted-logo.png" || error "Failed to run Portainer docker image!"

