# Lecture 85: Adding Docker networks for efficient cross-container communication.
# First, create a network and create the Mongo database conatiner inside of this network:
# 	docker network create goals-net
# 	docker run --name mongodb --rm -d --network goals-net mongo
# Build the backend Node image and create its container inside of the network:
# 	docker build -t goals-node ./backend
# 	docker run --name goals-backend --rm -d --network goals-net -p 80:80  goals-node

# Explanation for "docker run --name goals-backend --rm -d --network goals-net -p 80:80  goals-node" above:
# 1. Because the backend container need to communicate with the database in the network,
#    we need to change the root URL "localhost" in "/backend/app.js" to the database container name "mongodb".
# 2. If we don't use the network, the ports should be published to the local host machine
#    so that the containers can communicate with each other through the local host address.
#    If we use the network, there is no need to publish the port because the containers in the same network can communicate with each other anyway.
#    However, we still need to publish the backend port on our local host machine,
#    because the frontend React container isn't in the network.
#    So the separate frontend React container can communicate with the backend container.
#    And we don't publish the mongodb port,
#    because the mongodb container just communicates with the backend container but not with the frontend container,
#    and the mongodb container and the backend container are in the same network.
 
FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

CMD ["node", "app.js"]