FROM debian:bookworm

RUN apt-get update && apt-get install -y mariadb-server

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/script.sh /

RUN chmod +x /script.sh

RUN mkdir /run/mysqld

CMD ["/script.sh"]