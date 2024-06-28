# Lecture 87: Adding data persistence to MongoDB with volumes
# First, create the network and the frontend container.
#   docker network create goals-net
#   docker build -t goals-react ./frontend
#   docker run --name goals-frontend --rm -p 3000:3000 -it goals-react

# Now we want to protect the MongoDB database inside the container with a username and a password.
# We need to use the environment variables "MONGO_INITDB_ROOT_USERNAME" and "MONGO_INITDB_ROOT_PASSWORD" 
# for the Mongo image to create its container so that username and password are required to access the database.
# Now we set the username (MONGO_INITDB_ROOT_USERNAME) and password (MONGO_INITDB_ROOT_PASSWORD) to "alice" and "hello", respectively.
# Create the MongoDB container with the volumes and the environment variables:
# 	docker run --name mongodb -v data:/data/db --rm -d -e MONGO_INITDB_ROOT_USERNAME=alice -e MONGO_INITDB_ROOT_PASSWORD=hello --network goals-net mongo
# The MongoDB container stores the database files in the path "/data/db" (see the documentation of the official image for MongoDB).
# To test it, first we can save the data on the page and then remove the database container. And create it again to see that the data  on the page still exist.
# You don't to add the environment variables above if you don't want the authentication database.

# Besides, we also need to use the connection string which defines connections between MongoDB instances and apps.
# Here we use the URI connection string:
# "mongodb://<username>:<password>@mongodb:27017/course-goals?authSource=admin".
# Generally, we can set the environment variables to replace <username> and <password> in "mongodb://<username>:<password>@mongodb:27017/course-goals?authSource=admin".
# So <username> and <password> are "process.env.MONGODB_USERNAME" and "process.env.MONGODB_PASSWORD", respectively.
# Build the backend image and create its container:
# 	docker build -t goals-node ./backend
# 	docker run --name goals-backend -e MONGODB_USERNAME=alice -e MONGODB_PASSWORD=hello --rm -d --network goals-net -p 80:80 goals-node
# Note that "MONGODB_USERNAME" and "MONGODB_PASSWORD" here are for this backend container,
# and "MONGO_INITDB_ROOT_USERNAME" and "MONGO_INITDB_ROOT_PASSWORD" are for the mongodb container.

# Read Lecture 86 to fixing MongoDB authentication errors if you have some MongoDB authentication issues.

FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

ENV MONGODB_USERNAME=root MONGODB_PASSWORD=secret
# Set "MONGODB_USERNAME" and "MONGODB_PASSWORD" to "root" and "secret" respectively as the default values.
# Or we can seperate this one line instructions as two line as below:
# ENV MONGODB_USERNAME=root
# ENV MONGODB_PASSWORD=secret

CMD ["node", "app.js"]