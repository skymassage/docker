# Watch lecture 71 to learn about this demo app and read the cheatcheet for networks.

# Lecture 72 (case 1): Communicating between the container and the web
# We can communicate with web API's and web pages from inside our dockerized application (container)
# (like sending this HTTP request from inside the container) without any special settings.
# It works just as it worked without containers or Docker. 

# Lecture 73 (case 2): Communicating between the container and the host machine.
# Use "host.docker.internal" as a domain (root URL) in "app.js",
# which resolves to the internal IP address used by the host.
# Then Docker can do all required transformations, and it can ensure that this communication between container and host machine works.
# Build the image and run the container:
#   docker build -t favorites-node .
#   docker run --name favorites -d --rm -p 3000:3000 favorites-node

# Leture 74 (case 3a): Communicating between the container and the container by manually finding out the IP of the containers.
# Create a new container based on the MongoDB official image (it's a official image, so no need to build a new one) and it will create a MongoDB database:
#   docker run -d --name mongodb mongo
# Find the MongoDB container IP adress using "docker inspect mongodb" and use it in "app.js".
# This IP address can be used to communicate with the MongoDB container from this container.
# Build the image for app and create the its container
#   docker build -t favorites-node .
#   docker run --name favorites -d --rm -p 3000:3000 favorites-node
# But this method is not very convenient because we have to look up the IP address and hardcode it whenever the MongoDB container IP address changed.

# Leture 75 (case 3b): Use Docker networks and put the communicating containers into the same network
# First, create the network named "favorites-network":
#   docker network create favorites-network
# Create the Mongo container and attach it to the network using "--network <network_name>":
#   docker run --name mongodb --network favorites-network -d --rm mongo
# If the containers are part of the same network, we can just use their container names as the domain to let them communicate with each other.
# So the other Docker container's name will also be translated by Docker to the IP address of that container,
# and this automatic transformation will work if both containers are part of the same network.
# Build the image for app, and create the its container and then attach it to the same network:
#   docker build -t favorites-node .
#   docker run --name favorites --network favorites-network -d --rm -p 3000:3000 favorites-node
# We can inspect all existing networks (note that there are some built-in default networks):
#   docker network ls
# When we run the MongoDB container, I don't have the "-p" option here.
# Because the -p option is only required if we plan on connecting to something in that container
# from our local host machine or from outside the container network.  
# Here the only thing which connects to this MongoDB container will be our app container,
# which will be part of the same Docker network.
# In such cases, when we have container-to-container connections,
# we don't need to publish ports because inside that container network,
# all containers can communicate with each other freely and we don't need to expose any ports.

# Lecture 77: Docker network drivers
# Docker networks actually support different kinds of "drivers" which influence the behavior of the Network.
# The default driver is the "bridge" driver whose behavior has shown here, i.e.,
# the containers in the same network can find each other by the container names.
# The driver can be set when a network is created, simply by adding the --driver option:
# docker network create --driver <driver_type> <network_name>
# <driver_type> has these alternative types: "bridge", "host", "overlay", "macvlan", "none", third-party plugins.
# If we want to use the "bridge" driver ("--driver bridge"), we can omit "--driver bridge" which the default.
# And the "bridge" driver makes most sense in the vast majority of scenarios.

FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

CMD ["node", "app.js"]