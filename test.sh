#!/bin/bash

SERVER_TYPE=( "$(whiptail --title "Select your server" \
  --radiolist "Choose something" 20 78 4 \
  "centos_7" "Centos 7" OFF \
  "centos_8" "Centos 8" OFF \
  "ubuntu_20" "Ubuntu 20" OFF \
  "ubuntu_22" "Ubuntu 22" OFF 3>&1 1>&2 2>&3)" )

for choice in "${SERVER_TYPE[@]}"; do
./${choice}/server.sh
done
