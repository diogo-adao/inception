#!/bin/bash

set -e

mysqld --skip-networking &

until mysqladmin ping --silent &>/dev/null; do
    echo "Waiting for MariaDB to start..."
    sleep 1
done

mysql -u root -p"$ROOT_PWD" <<EOF
CREATE DATABASE IF NOT EXISTS \`${MARIADB_NAME}\`;
CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PWD}';
GRANT ALL PRIVILEGES ON \`${MARIADB_NAME}\`.* TO '${MARIADB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p"$ROOT_PWD" shutdown

exec mysqld
