# Pi-Hosted Portainer Template V3

This repository is a collection of tutorials for hosting a variety of server applications using Docker or Podman and [Portainer](https://github.com/portainer/portainer) on the Raspberry Pi or any other 64-bit Computer.

### App Template for Portainer
![App Template Image](https://github.com/Wishmasterflo/pi-hosted/blob/master/apptemplate.png?raw=true)

### Apps List

See the list of apps included in this template [here](https://github.com/Wishmasterflo/pi-hosted/blob/master/docs/AppList.md).

### Installation
As Base you can just install RaspberryPiOS lite (64-bit) and do a system update once to be on the latest PiOS Version.
Then run the script below for Docker or Podman to continue with the installation.
Also it is recommended to get the EEPROM Firmware updated once before going on.
```
sudo rpi-eeprom-update -d -a
sudo rpi-update
```

```
sudo apt update && sudo apt upgrade -y
sudo apt install git
```
Run `install_docker.sh`, to install docker, and add the current user to the docker usergroup.
or
Run `install_podman.sh`, to install Podman.

For Docker:
```
git clone https://github.com/Wishmasterflo/pi-hosted
cd pi-hosted
./install_docker.sh
```
For Podman:
```
git clone https://github.com/Wishmasterflo/pi-hosted
cd pi-hosted
./install_podman.sh
```
You need to reboot/logout for changes to take effect

### Reboot for changes to take effect

```
sudo reboot
```
After a reboot, run `install_portainer_docker.sh`, to install Portainer using Docker or
run `install_portainer_podman.sh`, to install Portainer using Podman. 

For Docker:
```
cd pi-hosted
./install_portainer_docker.sh 
```
For Podman:
```
cd pi-hosted
./install_portainer_podman.sh
```

### To update Portainer using Docker, run this command:
```
cd pi-hosted
./update_portainer_docker.sh
```
### To update Portainer using Podman, run this command:
```
cd pi-hosted
./update_portainer_podman.sh
```

### To reinstall Portainer, run this command:
```
cd pi-hosted
./reinstall_portainer_docker.sh
```


### Login to Portainer to update the App Template.

Goto pi-ip:9443 and then login

Click Settings, in the bottom-left corner, and paste the Portainer v3 json file link from below into the "App Templates" box.

You're done! Now just click App Templates and deploy applications!

#### Portainer Architecture

| Architecture | Tested OS's | URL |
| ------------ | ----------- | --- |
| Arm64   | Pi OS, Ubuntu, DietPi | https://raw.githubusercontent.com/Wishmasterflo/pi-hosted/master/template/portainer-v3-arm64.json|
| Amd64   | Ubuntu, Debian | https://raw.githubusercontent.com/Wishmasterflo/pi-hosted/master/template/portainer-v3-amd64.json |

