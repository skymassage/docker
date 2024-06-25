# Lecture 85: . Adding Docker networks for efficient cross-container communication
# First, create a network and create the Mongo database conatiner inside of this network:
# 	docker network create goals-net
# 	docker run --name mongodb --rm -d --network goals-net mongo
# Build the backend Node image and create its container inside of the network:
# 	docker build -t goals-node ./backend
# 	docker run --name goals-backend --rm -d --network goals-net -p 80:80  goals-node

# Explanation for "docker run --name goals-backend --rm -d --network goals-net -p 80:80  goals-node" above:
# 1. Because the backend container need to communicate with the database in the network,
#    we need to change the root URL "localhost" in /backend/app.js to the database container name "mongodb".
# 2. Beside, there is no need to publish the port because containers in the same network can communicate with each other anyway.
#    However, we still want to publish the port on our local host machine, so that the separate React container
#    (because it's not in the network) can talk to that.
#    Because the ports should be published to make the local host machine be able to communicate with the container through its local host address.

FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

CMD ["node", "app.js"]