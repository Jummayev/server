#!/bin/bash

echo "Enter sever host:"
read -r ipaddress


echo "Enter sever username: root"
read -r username
username=${username:-root}


echo "Enter sever port: 22"
read -r port
port=${port:-22}



ssh "$username"@"$ipaddress" -p "$port" 'bash -s' < /var/www/html/learn/server/server.sh


