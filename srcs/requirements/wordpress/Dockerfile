FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y php-fpm php-mysqli curl

COPY ./tools/www.conf /etc/php/8.2/fpm/pool.d/.

COPY ./tools/script.sh /

RUN chmod +x /script.sh

CMD ["/script.sh"]
