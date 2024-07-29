FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

# The following is optional and it documents that a process in the container will expose this port.
# But we still need to actually expose the port by "docker run -p <local_port>:80 <image_name>".
# Still, it is a best practice to also add EXPOSE in the Dockerfile to document this behavior.
EXPOSE 80

# The "CMD" instruction isn't executed when the image is built,
# but when a container is created and started based on that image.
CMD ["node", "server.js"]

# The Dockerfile contains all the instructions to build the image.
# A Docker image is composed of a series of read-only layers stacked on top of each other.
# Each layer represents a set of file system changes, and every Dockerfile instruction adds a new layer to the image.
# These layers are cached by Docker, enabling quicker image builds and efficient use of resources,
# and helping with image re-building and sharing. For example:
# In this Dockerfile, we have two COPY instructions: "COPY package.json ." and "COPY . .".
# Why we just use "COPY . ." only? 
# Because we require the "package.json" file in the container to execute "RUN npm install" without errors.
# If we use "COPY . ." only, we need to put it before "RUN npm install".
# However, when we change our code except the "package.json" file, we have to build a new image again.
# So we need to execute "COPY . ." again to update our code inside of the container,
# and it will lead to the rest of the instructions to be excuted again.
# Nevertheless, "RUN npm install" takes the longer to execute.
# To save the runtime, we execute "COPY package.json ." before "RUN npm install" and "COPY . .".
# Since the code in "package.json" doesn't change, we re-execute the instructions starting from "COPY . ."
# instead of executing the more time-consuming instruction "RUN npm install", which takes longer.

# Run:
#   docker build -t node_test .
#   docker run --name test -d -p 80:80 --rm node_test