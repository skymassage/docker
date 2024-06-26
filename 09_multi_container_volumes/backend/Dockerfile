# Lecture 87: Data persistence and security on MongoDB with volumes and the environment variables
# First, create the network and the frontend container.
#   docker network create goals-net
#   docker build -t goals-react ./frontend
#   docker run --name goals-frontend --rm -p 3000:3000 -it goals-react

# We can use the environment variables "MONGO_INITDB_ROOT_USERNAME" and "MONGO_INITDB_ROOT_PASSWORD"
# so that username and password are required to access the database.
# Besides, we also need to use the connection string which defines connections between MongoDB instances and apps.
# Here we use the URI connection string:
# "mongodb://<username>:<password>@mongodb:27017/course-goals?authSource=admin".
# And we use this to replace the URL "mongodb://mongodb:27017/course-goals" in /backend/app.js.

# Now we set the username (MONGO_INITDB_ROOT_USERNAME) and password (MONGO_INITDB_ROOT_PASSWORD) to "alice" and "hello", respectively.
# Build the backend image and create its container:
# 	docker build -t goals-node ./backend
# 	docker run --name goals-backend --rm -d --network goals-net -p 80:80  goals-node
# Create the MongoDB container with the volumes and the environment variables:
# 	docker run --name mongodb -v data:/data/db --rm -d -e MONGO_INITDB_ROOT_USERNAME=alice -e MONGO_INITDB_ROOT_PASSWORD=hello --network goals-net mongo
# The MongoDB container stores the database files in the path "/data/db" (see the documentation of the official image for MongoDB).
# To test it, first we can save the data on the page and then remove the database container. And create it again to see that the data  on the page still exist.
# You don't to add the environment variables above if you don't want the authentication database.

# Read Lecture 86 to fixing MongoDB authentication errors if you have some MongoDB authentication issues.

FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

CMD ["node", "app.js"]