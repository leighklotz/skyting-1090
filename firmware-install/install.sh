#!/bin/bash -xe

# disable ipv6
cat DISABLE_IPV6.md

sudo apt update
sudo apt upgrade 

sudo bash -c "$(wget -O - https://github.com/wiedehopf/adsb-scripts/raw/master/readsb-install.sh)"
sudo readsb-set-location 37.42886798912396 -122.11507960477661
sudo cp index.html /var/www/html/
sudo bash -c "$(curl -L -o - https://github.com/wiedehopf/graphs1090/raw/master/install.sh)"
sudo bash -c "$(wget -nv -O - https://github.com/wiedehopf/tar1090/raw/master/install.sh)"

sudo mg /etc/default/graphs1090

echo sudo reboot
