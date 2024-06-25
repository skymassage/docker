# Lecture 81: Learn about thus demo app
# Make sure the port "80", "3000", "27017" exist, which is going to be used.

# Lecture 82: Dockerizing the MongoDB service
# Creat the Mongo container:
#   docker run --name mongodb --rm -d -p 27017:27017 mongo
# Add "-p" above because as long as the backend API is not dockerized,
# this node API (backend) still talks to the database here when it connects,
# as if it would be running on our local host machine.
# Now if we create a container containing the database, we need to expose this port "27017"
# (27017 is the default MongoDB port and we see it in /backend/app.js) from our container to our local machine.

# Lecture 83: Dockerizing the node app (backend)
# Use "host.docker.internal" in /backend/app.js to resolve to the internal IP address
# used by the host inside of the database container (we have dockerized the Mongo database).
# Build the backend image based on this Dockerfile and create its container:
#   docker build -t goals-node ./backend
#   docker run --name goals-backend --rm -d -p 80:80 goals-node
FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

CMD ["node", "app.js"]