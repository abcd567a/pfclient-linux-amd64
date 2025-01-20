#!/bin/bash

BINARY_VERSION=pfclient_5.0.162_amd64
ASSETS_FOLDER=/usr/share/pfclient
sudo mkdir ${ASSETS_FOLDER}
echo "Downloading i386 binary tarball " ${BINARY_VERSION}.tar.gz "from Planefinder.net"
sudo apt install wget
sudo wget -O ${ASSETS_FOLDER}/${BINARY_VERSION}.tar.gz "http://client.planefinder.net/${BINARY_VERSION}.tar.gz"
sudo tar zxvf  ${ASSETS_FOLDER}/${BINARY_VERSION}.tar.gz -C ${ASSETS_FOLDER}
sudo cp ${ASSETS_FOLDER}/pfclient /usr/bin/pfclient
sudo chmod +x /usr/bin/pfclient

echo "Creating log folder ...."
sudo mkdir -p /var/log/pfclient

echo "downloading and installing config file pfclient-config.json"
sudo wget -O ${ASSETS_FOLDER}/pfclient-config.json https://github.com/abcd567a/pfclient-linux-amd64-i386/raw/master/pfclient-config.json
sudo cp ${ASSETS_FOLDER}/pfclient-config.json /etc/pfclient-config.json
sudo chmod 666 /etc/pfclient-config.json

echo "Downloading and installng init file pfclient"

sudo wget -O ${ASSETS_FOLDER}/pfclient https://github.com/abcd567a/pfclient-linux-amd64-i386/raw/master/pfclient
sudo cp ${ASSETS_FOLDER}/pfclient /etc/init.d/pfclient
sudo chmod +x /etc/init.d/pfclient
sudo update-rc.d -f pfclient defaults
sudo update-rc.d pfclient enable
sudo service pfclient start

echo " "
echo " "
echo -e "\e[32m INSTALLATION COMPLETED \e[39m"
echo -e "\e[32m=======================\e[39m"
echo -e "\e[32m PLEASE DO FOLLOWING:\e[39m"
echo -e "\e[32m=======================\e[39m"
echo -e "\e[32m SIGNUP:\e[39m"
echo -e "\e[32m In your browser, go to web interface at\e[39m"
echo -e "\e[39m     http://$(ip route | grep -m1 -o -P 'src \K[0-9,.]*'):30053 \e[39m"
echo -e "\e[32m Fill necessary details to sign up / sign in\e[39m"
echo -e "\e[32m Use IP Address 127.0.0.1 and Port number 30005 when asked for these\e[39m"
echo -e "\e[31m If it fails to save settings when you hit button [Complete Configuration],\e[39m"
echo -e "\e[31m then restart pfclient by following command, and again hit [Complete Configuration] button\e[39m"
echo "     sudo systemctl restart pfclient " 
echo " "
echo " "
echo -e "\e[32mTo see status\e[39m sudo systemctl status pfclient"
echo -e "\e[32mTo restart\e[39m    sudo systemctl restart pfclient"
echo -e "\e[32mTo stop\e[39m       sudo systemctl stop pfclient"


