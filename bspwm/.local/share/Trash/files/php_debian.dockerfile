FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN apt-get install -y \ 
        libzip-dev \
    && docker-php-ext-install zip

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

#RUN adduser -g users -s /bin/sh -D luckytuvshee
RUN useradd -m -g users -s /bin/bash luckytuvshee

RUN mkdir -p /var/www/html

RUN chown luckytuvshee: /var/www/html

WORKDIR /var/www/html

