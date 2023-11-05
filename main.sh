#!/bin/bash

echo  "$0"

#SERVER_TYPE=( "$(whiptail --title "Select your server" \
#  --radiolist "Choose something" 20 78 4 \
#  "centos_7" "Centos 7" OFF \
#  "centos_8" "Centos 8" OFF \
#  "ubuntu_20" "Ubuntu 20" OFF \
#  "ubuntu_22" "Ubuntu 22" OFF 3>&1 1>&2 2>&3)" )
#
#  chmod +x server.sh  ./"${SERVER_TYPE[0]}"/server.sh
#./"${SERVER_TYPE[0]}"/server.sh



#
##!/bin/bash
#
#echo "Enter sever host:"
#read -r ipaddress
#
#
#echo "Enter sever username: root"
#read -r username
#username=${username:-root}
#
#
#echo "Enter sever port: 22"
#read -r port
#port=${port:-22}
#
#
#
#ssh "$username"@"$ipaddress" -p "$port" 'bash -s' < /var/www/html/learn/server/server.sh


