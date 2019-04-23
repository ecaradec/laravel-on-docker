FROM php:fpm
RUN apt-get update && apt-get install vim git zip unzip -y
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN echo 'precedence ::ffff:0:0/96 100' >> /etc/gai.conf
RUN composer config --global repo.packagist composer https://packagist.org
RUN composer global require hirak/prestissimo
RUN docker-php-ext-install pdo pdo_mysql
USER 1000:1000
