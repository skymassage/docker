

FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

# The following is optional and it documents that a process in the container will expose this port.
# But we still need to actually expose the port by "docker run -p <local_port>:80 <image_name>".
# Still, it is a best practice to also add EXPOSE in the Dockerfile to document this behavior.
EXPOSE 80

CMD ["node", "server.js"]

# The Dockerfile contains all the instructions to build the image.
# A Docker image is composed of a series of read-only layers stacked on top of each other.
# Each layer represents a set of file system changes, and every Dockerfile instruction adds a new layer to the image.
# These layers are cached by Docker, enabling quicker image builds and efficient use of resources,
# and helping with image re-building and sharing. For example:
# In this Dockerfile, we have two instruction: "COPY package.json ." and "COPY . .",
# and we require the "package.json" file in the container before "RUN npm install" to avoid errors.
# We can copy all files into the container with just one instruction "COPY . ." before "RUN npm install".
# However, if we change the code in the "server.js" file and we want to see the change, we need to build the new image.
# Because the code in the container has been different from the one in our host machine.
# So we need to execute "COPY . ." again, and the rest of the instructions are also excuted again,
# Here we execute "COPY package.json ." before "RUN npm install" and then execute "COPY . ." to copy the remaining files.
# When we change the code in "server.js", we need to build the new image again.
# But this time we execute the remaining instructions after "RUN npm install", and docker can use the caches before "COPY . .",
# so "RUN npm install" isn't executed again.
# Among all the instructions in this image, "FROM node" and "RUN npm install" take the longer to execute.
# Therefore, it can save much time for building the new image if we change the code in "server.js".