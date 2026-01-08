FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx && apt-get install -y openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=PT/L=PT/O=42/OU=student/CN=diolivei.42.fr"

COPY ./tools/default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]