#!/bin/bash -xe

echo "* disable ipv6"
cat DISABLE_IPV6.md

echo "* armbian updates"
sudo apt update
sudo apt upgrade 

echo "* fix random mac addr"
sudo cp zz-10-override-wifi-random-mac-disable.conf /etc/NetworkManager/conf.d/

echo "* make wifi not go to sleep"
sudo cp zz-20-override-wifi-powersave-disable.conf /etc/NetworkManager/conf.d/

echo "* allow ping to work without sudo"
echo "net.ipv4.ping_group_range = 0 2147483647" | sudo tee /etc/sysctl.d/99-ping.conf
sudo sysctl --system


echo "* install readsb"
sudo bash -c "$(wget -O - https://github.com/wiedehopf/adsb-scripts/raw/master/readsb-install.sh)"
sudo readsb-set-location 37.42886798912396 -122.11507960477661
sudo cp index.html /var/www/html/

echo "*install graphs1090"
sudo bash -c "$(curl -L -o - https://github.com/wiedehopf/graphs1090/raw/master/install.sh)"

echo "*install tar1090"
sudo bash -c "$(wget -nv -O - https://github.com/wiedehopf/tar1090/raw/master/install.sh)"

echo "* now you should edit the config for graphs1090...please wait."
sleep 10
sudo mg /etc/default/graphs1090

echo "ok going to reboot"
sleep 10

echo sudo reboot
