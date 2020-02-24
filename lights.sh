#!/bin/bash

# https://raspberrypi-aa.github.io/session2/bash.html

GPIOPIN=17
# prepare the pin
if [ ! -d /sys/class/gpio/gpio${GPIOPIN} ]; then
  echo "${GPIOPIN}" > /sys/class/gpio/export
fi
echo "out" > /sys/class/gpio/gpio"${GPIOPIN}"/direction

shutdown()
{
    echo "0" > /sys/class/gpio/gpio${GPIOPIN}/value
    exit
}

# Turn LED off if script is killed
trap shutdown SIGINT

# Get API key from config file, and validate key is present
# API key only exists if 'regenerate api key on reboot' is disabled
APIKEY="$(cat /etc/astrobox/config.yaml | grep 'key:' | awk '{print $2}')"
if [ -z ${APIKEY+x} ]; then
    echo "APIKEY is not available, ensure 'Regenerate Api key' is disabled" >&2
    exit 1
fi

while [ 1 ]
do 
    printstate=$(curl --silent --location --request GET --header "X-Api-Key: ${APIKEY}" http://localhost/api/job | grep 'state' | awk '{print $2}')
    echo "Printer Status is: ${printstate}"
    if [ $printstate == "Printing" ]; then
        echo "Turning LED lights on"
        echo "1" > /sys/class/gpio/gpio${GPIOPIN}/value
    else
        echo "Turning LED lights off"
        echo "0" > /sys/class/gpio/gpio${GPIOPIN}/value
    fi
    sleep 1
done