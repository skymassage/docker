FROM composer:latest

WORKDIR /var/www/html
# Similar to php.dockerfile, use Composer to create a Laravel app in "/var/www/html" inside of the container.

ENTRYPOINT [ "composer", "--ignore-platform-reqs" ]
# "--ignore-platform-reqs" ensures that we can run this without any warnings or errors even if some dependencies would be missing.