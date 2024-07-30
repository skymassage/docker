# FROM php:8.0-fpm-alpine
FROM php:8.1-fpm-alpine3.18

# "/var/www/html" is a standard folder on the web server to serve your website, 
# and we use the folder which should hold our final app, so we install these extra dependencies there.
# And we'll stick to this folder for all this entire module because this folder inside of the container should hold our Laravel PHP app.
# So in "nginx/nginx.conf", we assume that the web app files can be found in the subfolder (/var/www/html/public) of this folder.
WORKDIR /var/www/html

# It's necessary for deploying the container (refer to nginx.dockerfile).
COPY src .

# This command installs some extra dependencies we need.
# Conveniently, there is a tool "docker-php-ext-install" which we can use to install that.
# "pdo" and "pdo_mysql" are our PHP extensions we need.
RUN docker-php-ext-install pdo pdo_mysql

# Add a new group.
RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

# This php image actually restricts read and write access by the container.
# It isn't a problem with the bind mount, but it will be a problem if we work only inside of the container.
# Since Laravel needs to generate files in that folder during the php code execution,
# for example, log files or cache views, we need to grant this write access here.
# Run this command to give our container write access to certain folders (our working directory "/var/www/html"):
# RUN chown -R www-data:www-data /var/www/html
RUN chown -R laravel:laravel /var/www/html
# "chown" is a Linux command for changing folder or file ownership and controlling who's allowed to read or write to folders:
#   chown <options> <user><:group> <files>
# Change the ownership of the files to a user or a user group, where the user group should be prefixed with  ':'.
# "-R" means to recursively modify all files in the entire folder, so <files> will be a directory.
# "www-data" user is the default user and user group created by this php image,
# By default, "www-data" has no write access to this working directory.
# So it simply ensures that this default user, which is set up by this php image,
# has write access to this folder which binds our source code.

# Set user and group ID.
USER laravel

# We don't have CMD or ENTRYPOINT here, instead we end with the RUN instruction. 
# If we don't have CMD or ENTRYPOINT at the end of Dokcerfile,
# then the command or entry point of the base image will be used if it has any.
# And this PHP base image will have a default command which is a command that invokes the PHP interpreter.
# So this image we're building here will automatically run this default command of the base image.
# And therefore it will be able to deal with incoming PHP files that should be interpreted,
# because our base image is invoking this interpreter.