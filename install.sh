#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "Error: This script must be run as root" 
   exit 1
fi

echo "creating /etc/astrobox-lights"
mkdir -p /etc/astrobox-lights

echo "downloading lights.sh to /etc/astrobox-lights"
curl -s https://raw.githubusercontent.com/spuder/astrobox-lights/master/lights.sh -o /etc/astrobox-lights/lights.sh
chmod +x /etc/astrobox-lights/lights.sh

echo "downloading systemd unit file to /etc/systemd/system/lights.service"
curl -s https://raw.githubusercontent.com/spuder/astrobox-lights/master/lights.service -o /etc/systemd/system/lights.service

echo "starting service"
systemctl daemon-reload
service lights restart
