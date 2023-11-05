#!/bin/bash

# Tanlangan programmalar uchun o'zgaruvchilar
selected_programs=( "$(whiptail --title "Serveringizni tanlang" \
  --checklist "Nima tanaysiz?" 20 80 7  \
  "php_7_4" "Centos 7" OFF \
  "php_8_0" "Centos 8" ON \
  "php_8_1" "Ubuntu 20" OFF \
  "redis" "Ubuntu 20" ON \
  "postgres_15" "Ubuntu 22" ON 3>&1 1>&2 2>&3)" )

# Tanlanmagan holatni tekshirish
if [ -z "${selected_programs[*]}" ]; then
    echo "Siz hech qanday dasturni tanlamadingiz. Dastur boshlandi."
else
    # Tanlangan programmalar bo'yicha amallar
    for choice in ${selected_programs}; do
        case "$choice" in
            '"php_7_4"')
                echo "php_7_4 tanlandi."
                # Boshqa amalni bajarish mumkin
                ;;
            '"php_8_0"')
                echo "php_8_0 tanlandi."
                # Boshqa amalni bajarish mumkin
                ;;
            '"php_8_1"')
                echo "php_8_1 tanlandi."
                # Boshqa amalni bajarish mumkin
                ;;
            '"redis"')
                echo "redis tanlandi."
                # Boshqa amalni bajarish mumkin
                ;;
            '"postgres_15"')
                echo "postgres_15 tanlandi."
                # Boshqa amalni bajarish mumkin
                ;;
        esac
    done
fi
