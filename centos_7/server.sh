#!/bin/bash

#install tool
echo "Install wget, unzip, nano, curl applications "
sleep 5
sudo dnf install wget unzip nano curl
#================================================================================
#install nginx
echo "Started installing nginx... "
sleep 5

dnf install nginx -y

systemctl start nginx

firewall-cmd --permanent --add-service=http

firewall-cmd --permanent --add-service=https

firewall-cmd --reload

#================================================================================
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

PHP_FPM_CONFIG_FILE=/etc/php-fpm.d/www.conf
sed -i "s/user = .*/user = nginx/" "$PHP_FPM_CONFIG_FILE"
sed -i "s/group = .*/group = nginx/" "$PHP_FPM_CONFIG_FILE"
sed -i "s/listen.owner = .*/listen.owner = nginx/" "$PHP_FPM_CONFIG_FILE"
sed -i "s/listen.group = .*/listen.group = nginx/" "$PHP_FPM_CONFIG_FILE"

systemctl reload php-fpm

systemctl restart php-fpm

#================================================================================
echo "Started installing composer... "
sleep 5
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

# shellcheck disable=SC2034
HASH="$(wget -q -O - https://composer.github.io/installer.sig)"

php composer-setup.php --install-dir=/usr/local/bin --filename=composer

composer

#================================================================================
#postgres install
echo "Started installing postgres... "
sleep 5
dnf module list postgresql

dnf module enable postgresql:15 -y

dnf install postgresql-server -y

postgresql-setup --initdb

systemctl start postgresql

systemctl enable postgresql

systemctl restart postgresql

#step 2 config postgres

#grep listen_addresses /var/lib/pgsql/data/postgresql.conf
#
#grep -v -E "^#|^$" /var/lib/pgsql/data/pg_hba.conf

#firewall-cmd --add-service=postgresql
#
#firewall-cmd --runtime-to-permanent

#================================================================================
#install redis
#https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-centos-8
dnf install redis

nano /etc/redis.conf

#change supervised not to supervised systemd

systemctl start redis.service

systemctl enable redis

#nano /etc/redis.conf
REDIS_CONFIG_FILE=/etc/redis.conf

REDIS_PASSWORD="$( $RANDOM | md5sum | head -c 32 )"

sed -i "s/# masterauth <master-password>.*/ # masterauth <master-password> \n requirepass $REDIS_PASSWORD/" "$REDIS_CONFIG_FILE"

#If your Redis data directory has insecure permissions (for example, it’s world-readable) you can ensure that only the Redis user and group have access to the folder and its contents by running the chmod command. The following example changes this folder’s the permissions setting to 770:
chmod 770 /var/lib/redis

systemctl restart redis

echo "

Redis password: $REDIS_PASSWORD


"

#firewall-cmd --permanent --new-zone=redis
#firewall-cmd --permanent --zone=redis --add-port=6379/tcp
#grep ssh /etc/services
#firewall-cmd --zone=public --add-port=55555/tcp --permanent
#firewall-cmd --reload