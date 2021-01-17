FROM composer:latest

RUN adduser -g users -s /bin/sh -D luckytuvshee

WORKDIR /var/www/html