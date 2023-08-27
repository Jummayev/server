#!/bin/bash

PROGRAM_TYPE=( "$(whiptail --title "Select your server" \
  --checklist "Choose something" 20 80 7  \
  "php_7_4" "Centos 7" OFF \
  "php_8_0" "Centos 8" ON \
  "php_8_1" "Ubuntu 20" OFF \
  "redis" "Ubuntu 20" ON \
  "postgres_15" "Ubuntu 22" ON 3>&1 1>&2 2>&3)" )

if [ -z "${PROGRAM_TYPE[*]}" ]; then
    echo "Siz birinta ham programma tanlamadiz biz kegin nima ish qilishni bilmay dasturni yopdik"
  else
    for choice in "${PROGRAM_TYPE[@]}"; do
      if [ "$choice" =  "php_7_4" ]; then
        echo "php_7_4"
      elif [ "$choice" =  "php_8_0" ]; then
        echo "php_8_0"
      elif [ "$choice" =  "php_8_1" ]; then
        echo "php_8_1"
      elif [ "$choice" =  "redis" ]; then
        echo "redis"
      elif [ "$choice" =  "postgres_15" ]; then
        echo "postgres_15"
      fi
    done
fi

