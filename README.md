# Turn a light on with a raspberry pi when a print job starts


## Enable ssh on astrobox

SSH must be enabled on the astrobox. The easiest way to enable it is:

- Power off astrobox
- Remove SD card
- Plug SD card into a computer
- Create '/ssh' text file in root of card
- Plug SD card back into raspberry pi

```
cd /Volumes/boot
touch ssh
```

You should now be able to ssh into the pi (password is 'raspberry')

```
ssh pi@192.168.1.99
```

![](https://astroprint.zendesk.com/hc/en-us/articles/360000306923-How-can-I-enable-SSH-in-my-AstroBox-)


## Disable automatic API key rotation on reboot

- Go to the astrobox gui
- Navigate to 'Settings' -> 'Advanced'
- Unckeck "Regenerate API Key on Reboot"

![](./images/regenerate_key.png)

## Electronics

Setup a `IRLZ34N` MOSFET and connect it to pin 17 on the raspberry pi (6th pin down)

![](./images/led_wiring.png)

## Installation

Configure this script to run on a schedule

TODO: pipe to bash


## Troubleshooting

```
journalctl -u lights -f
```

## Resources

![](https://dordnung.de/raspberrypi-ledstrip/)
![](https://raspberrypi-aa.github.io/session2/bash.html)
![](https://medium.com/coinmonks/controlling-raspberry-pi-gpio-pins-from-bash-scripts-traffic-lights-7ea0057c6a90)
