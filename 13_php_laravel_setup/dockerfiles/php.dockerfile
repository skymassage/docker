FROM php:8.0-fpm-alpine

WORKDIR /var/www/html

# This command installs some extra dependencies we need.
# Conveniently, there is a tool "docker-php-ext-install" which we can use to install that.
# "pdo" and "pdo_mysql" are our PHP extensions we need.
RUN docker-php-ext-install pdo pdo_mysql