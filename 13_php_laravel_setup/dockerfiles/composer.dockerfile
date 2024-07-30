# FROM composer:latest
FROM composer:2.6

# Same instruction in php.dockerfile
RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

# Same instruction in php.dockerfile
USER laravel 

# Similar to php.dockerfile, use Composer to create a Laravel app in "/var/www/html" inside of the container.
WORKDIR /var/www/html

# Unsure if this is needed
# USER root 

# "--ignore-platform-reqs" ensures that we can run this without any warnings or errors even if some dependencies would be missing.
ENTRYPOINT [ "composer", "--ignore-platform-reqs" ]