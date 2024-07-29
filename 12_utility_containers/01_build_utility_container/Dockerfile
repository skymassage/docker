FROM node:14-alpine
# We want to build a utility container, so we want an extra slim setup here.
# And we'll use this Alpine version, which uses an extra slim operating system layer and is very slim and optimized Node base image.

WORKDIR /app

# The idea behind having a utility container is that we can use it to execute something,
# which has an effect on the host machine without having to actually install all the extra tools on the host machine.
# First, create this image:
# 	docker build -t node-util .
# We want to mirror the working directory inside of the container to our local folder
# so that what we create in the container is also available on our host machine.  
# And we bind our folder here to the working directory we have in the container:
# 	docker run -v $(pwd):/app -it node-util npm init
# We can see that "package.json" appears on our host machine.
# Therefore, we can still use this utility container to create projects
# through "npm init" without installing Node and npm on the host.