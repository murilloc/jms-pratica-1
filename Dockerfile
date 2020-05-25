FROM php:7.4.6-fpm-alpine3.11

RUN apk update
RUN apk add --no-cache bash openssl mysql-client nodejs npm curl libzip-dev zip
RUN docker-php-ext-install pdo pdo_mysql zip bcmath
RUN docker-php-ext-configure zip

RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

WORKDIR /var/www
RUN rm -rf /var/www/html
COPY . /var/www
RUN ln -s public html

EXPOSE 9000
ENTRYPOINT ["php-fpm"]
