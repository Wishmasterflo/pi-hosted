# Pi-Hosted Portainer Template V2

This repository is a collection of tutorials for hosting a variety of server applications using Docker or Podman and [Portainer](https://github.com/portainer/portainer).

### App Template for Portainer
![App Template Image](https://github.com/Wishmasterflo/pi-hosted/blob/master/apptemplate.png?raw=true)

### Apps List

See the list of apps included in this template [here](https://github.com/Wishmasterflo/pi-hosted/blob/master/docs/AppList.md).

### Installation
Run `install_docker.sh`, to install docker, and add the current user to the docker usergroup.
or
Run 'install_podman.sh', to install Podman.

For Docker:
```
wget -qO- https://github.com/Wishmasterflo/pi-hosted/master/install_docker.sh | bash
```
For Podman:
```
wget -qO- https://github.com/Wishmasterflo/pi-hosted/master/install_podman.sh | bash
```
You need to reboot/logout for changes to take effect

### Reboot for changes to take effect

```
sudo reboot
```

After a reboot, run `install_portainer.sh`, to install Portainer.io

```
wget -qO- https://github.com/Wishmasterflo/pi-hosted/master/install_portainer.sh | bash
# to update portainer, run this command instead
wget -qO- https://github.com/Wishmasterflo/pi-hosted/master/update_portainer.sh | bash
```

### Login to Portainer to update the App Template.

Goto pi-ip:9000 (or pi-ip:9443) and then login

Click Settings, in the bottom-left corner, and paste the Portainer v2 json file link from below into the "App Templates" box.

You're done! Now just click App Templates and deploy applications!

#### Portainer Architecture

| Architecture | Tested OS's | URL |
| ------------ | ----------- | --- |
| **Arm32 | Pi OS, DietPi | https://raw.githubusercontent.com/pi-hosted/pi-hosted/master/template/portainer-v2-arm32.json |
| Arm64   | Pi OS, Ubuntu, DietPi | https://github.com/Wishmasterflo/pi-hosted/master/template/portainer-v2-arm64.json |
| Amd64   | Ubuntu, Debian | https://raw.githubusercontent.com/pi-hosted/pi-hosted/master/template/portainer-v2-amd64.json |

* Amd64 should work on all distros with **scripts written for Debian based distros**


