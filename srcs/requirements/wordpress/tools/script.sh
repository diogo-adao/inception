#!/bin/bash

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root

./wp-cli.phar config create --dbname="$MARIADB_NAME" --dbuser="$MARIADB_USER" --dbpass="$MARIADB_PWD" --dbhost=mariadb --allow-root

./wp-cli.phar core install --url=diolivei.42.fr --title=inception --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PWD" --admin_email="$ADMIN_EMAIL" --allow-root

./wp-cli.phar user create $USER_NAME $USER_EMAIL --role=author --user_pass=$USER_PWD --allow-root

php-fpm8.2 -F