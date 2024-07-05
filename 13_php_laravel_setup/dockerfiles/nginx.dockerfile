# Ensure that we always copy in a snapshot  of our configuration and of our source code into the image,
# and we're not relying on just the bind mount in docker-compose.yaml.
# The bind mount will still help us during development so that the latest code and the latest configuration is bound into that container.
# But if we deploy the container, we'll not have these bind mounts,
# meaning source code and other dependencies won't be part of the deploy nginx server container.
# So then the snapshots copied into the image will become important, 
# and we copy "nginx.conf" and our source folder into the container.

# FROM nginx:stable-alpine
FROM nginx:1.26.1-alpine-slim

WORKDIR /etc/nginx/conf.d

COPY nginx/nginx.conf .

RUN mv nginx.conf default.conf

WORKDIR /var/www/html

COPY src .

# Here we don't need to specify "ENTRYPOINT" or "CMD" because the nginx image already has a default command.
# And if we don't specify our own one, the default one will be executed. And that will be the one to start this web server.