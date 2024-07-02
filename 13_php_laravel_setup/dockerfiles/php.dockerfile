FROM php:8.0-fpm-alpine

# "/var/www/html" is a standard folder on web servers to serve your website from, 
# and we use the folder which should hold our final app, so we install these extra dependencies there.
# And we'll stick to this folder for all this entire module because this folder inside of the container should hold our Laravel PHP app.
# So in "nginx/nginx.conf", we assume that the web app files can be found in the subfolder (/var/www/html/public) of this folder.
WORKDIR /var/www/html

# This command installs some extra dependencies we need.
# Conveniently, there is a tool "docker-php-ext-install" which we can use to install that.
# "pdo" and "pdo_mysql" are our PHP extensions we need.
RUN docker-php-ext-install pdo pdo_mysql

# We don't have CMD or ENTRYPOINT here, instead we end with the RUN instruction. 
# If we don't have CMD or ENTRYPOINT at the end of Dokcerfile, then the command or entry point of the base image will be used if it has any.
# And this PHP base image will have a default command which is a command that invokes the PHP interpreter.
# So this image we're building here will automatically run this default command of the base image.
# And therefore it will be able to dea  with incoming PHP files that should be interpreted,
# because our base image is invoking this interpreter.