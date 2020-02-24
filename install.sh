mkdir -p /etc/astrobox-lights

curl https://raw.githubusercontent.com/spuder/astrobox-lights/master/lights.sh -o /etc/astrobox-lights/lights.sh
chmod +x /etc/astrobox-lights/lights.sh

curl https://raw.githubusercontent.com/spuder/astrobox-lights/master/lights.service -o /etc/systemd/system/lights.service

service lights restart
