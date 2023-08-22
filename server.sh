#!/bin/bash

#install tool
#

echo "Install wget, unzip, nano, curl applications "
sudo dnf install wget unzip nano curl

#install nginx
echo "Started installing nginx... "
sleep 5

dnf install nginx -y

systemctl start nginx

firewall-cmd --permanent --add-service=http

firewall-cmd --permanent --add-service=https

firewall-cmd --reload


#install php
echo "Started installing php... "
sleep 5
dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y

dnf install epel-release -y

dnf module list php

dnf module enable php:remi-8.1 -y

dnf install php -y

php -v

sleep 5

dnf install php-redis php-pgsql php-zip php-soap php-gd php-fpm php-cli php-json -y

systemctl start php-fpm

systemctl enable php-fpm

systemctl reload php-fpm

systemctl restart php-fpm



## scp /var/www/html/learn/server/server.sh root@192.168.122.1:/home/server.sh
#
#
##install composer
#php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
#
## shellcheck disable=SC2034
#HASH="$(wget -q -O - https://composer.github.io/installer.sig)"
#
#php composer-setup.php --install-dir=/usr/local/bin --filename=composer
#
#composer
#

##postgres install
#
#dnf module list postgresql
#
#dnf module enable postgresql:15 -y
#
#dnf install postgresql-server -y
#
#postgresql-setup --initdb
#
#systemctl start postgresql
#
#systemctl enable postgresql
#
##step 2 config postgres
#
#grep listen_addresses /var/lib/pgsql/data/postgresql.conf
#
#grep -v -E "^#|^$" /var/lib/pgsql/data/pg_hba.conf
#
#firewall-cmd --add-service=postgresql
#
#firewall-cmd --runtime-to-permanent
#
#
##install redis
##https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-centos-8
#dnf install redis
#
#nano /etc/redis.conf
#
##change supervised not to supervised systemd
#
#systemctl start redis.service
#
#systemctl enable redis
#
#systemctl status redis
#
#
#nano /etc/redis.conf
#
#firewall-cmd --permanent --new-zone=redis
#
#firewall-cmd --permanent --zone=redis --add-port=6379/tcp
#
#firewall-cmd --reload
#
#requirepass 37f5c2610f23e08c5a4bdf1ed49b616f3d2730610c27959968e48226050ff6c0
#
#systemctl restart redis
#
##If your Redis data directory has insecure permissions (for example, it’s world-readable) you can ensure that only the Redis user and group have access to the folder and its contents by running the chmod command. The following example changes this folder’s the permissions setting to 770:
#chmod 770 /var/lib/redis
#
##firewall-cmd
#grep ssh /etc/services
#
#firewall-cmd --zone=public --add-port=55555/tcp --permanent
