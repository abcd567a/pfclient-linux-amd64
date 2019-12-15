#!/bin/bash

BINARY_VERSION=pfclient_4.1.1_i386
RESOURCE_FOLDER=/usr/share/pfclient
sudo mkdir ${RESOURCE_FOLDER}
echo "Downloading i386 binary tarball " ${BINARY_VERSION}.tar.gz "from Planefinder.net"
sudo apt install wget
sudo wget -O ${RESOURCE_FOLDER}/${BINARY_VERSION}.tar.gz "http://client.planefinder.net/${BINARY_VERSION}.tar.gz"
sudo tar zxvf  ${RESOURCE_FOLDER}/${BINARY_VERSION}.tar.gz -C ${RESOURCE_FOLDER}
sudo cp ${RESOURCE_FOLDER}/pfclient /usr/bin/pfclient

echo -e "\e[32m installing libc6-i386 required by pfclient i386 binary\e[39m"
sudo apt-get install libc6-i386  

#echo "Creating config file pfclient-config.json"
#CONFIG_FILE=/etc/pfclient-config.json
#sudo touch ${CONFIG_FILE}
#sudo chmod 777 ${CONFIG_FILE}
#echo "Writing code to config file pfclient-config.json"
#/bin/cat <<EOM >${CONFIG_FILE}
#{}
#EOM

#sudo chmod 666 ${CONFIG_FILE}


echo "downloading config file pfclient-config.json"
sudo wget -O /etc/pfclient-config.json https://raw.githubusercontent.com/abcd567a/pfclient-linux-amd64/master/pfclient-config.json
sudo chmod 666 /etc/pfclient-config.json

echo "Downloading init file pfclient to folder /etc/init.d "

sudo wget -O /etc/init.d/pfclient https://raw.githubusercontent.com/abcd567a/pfclient-linux-amd64/master/pfclient
sudo chmod +x /etc/init.d/pfclient
sudo update-rc.d pfclient defaults
sudo update-rc.d pfclient enable

sudo systemctl restart pfclient

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


