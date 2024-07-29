# Lecture 88: Volumes, bind mounts and polishing for the NodeJS container

# First, create the network, and create the database container with username and password:
# 	docker network create goals-net
# 	docker run --name mongodb -v data:/data/db --rm -d -e MONGO_INITDB_ROOT_USERNAME=alice -e MONGO_INITDB_ROOT_PASSWORD=hello --network goals-net mongo

# When we start the container with the Node command "run app.js".
# This basically logs the code when the container starts, or we can say that the Node process loads all the code and then starts the code.
# So, if the code changes thereafter, this has no impact on the already running node server.
# And we want the Node server to restart whenever the code changes, and we can stop and restart the container,
# but we can do better. We can add the extra dependency to this backend app,
# which will restart the server automatically for us when the code changes.
# In /backend/packaged.js, we add '"devDependencies":{"nodemon": "^2.0.4"}',
# where "nodemon" is an extra tool which watches the project folder for changes in JavaScript files,
# so if such a JavaScript file changes, it restarts the Node server.
# So we can restarts the node server and watch for file changes without manually restarting the container.
# And then add '"start": "nodemon app.js"' into "scripts" in /backend/package.json to utilize nodemon to run app.js.
# Finally, we don't need "package-lock.json" and delete it.

# Build the backend image and create its container with volumes and bind mount:
# 	docker build -t goals-node ./backend
# 	docker run --name goals-backend -v $(pwd)/backend:/app -v logs:/app/logs -v /app/node_modules -e MONGODB_USERNAME=alice -e MONGODB_PASSWORD=hello --rm -d --network goals-net -p 80:80 goals-node
# We want that when the source code in the local host project folder changes,
# the corresponding code in the container also changes.
# We want to view the logs and Node writes the logs to "/app/logs" inside of the container.
# Note that if we don't have the "node_modules" folder on the local host,
# we couldn't overwrite the existing "node_modules" in the container with the non-existing one here,
# which would cause our container to crash.
# Note that longer container internal paths have precedents and overwrite shorter paths.

# Now the app uses nodemon internally, and we can change our code and verify this change by running:
# 	docker logs goals-backend

# Copying "node_modules" with "COPY . ." may overwrite the latest "node_modules" created by "NPM install",
# because the "node_modules" on the local host may not be the latest one.
# We can delete "node_modules" on the local host, but maybe we're also sometimes working on this project locally,
# so we still need it here.
# To handle this, we can create a ".dockerignore" file that contains "node_modules" and some other files 
# that we don't want to copy into, and it also make image creation faster. 

FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

ENV MONGODB_USERNAME=root MONGODB_PASSWORD=secret

CMD ["npm", "start"]
# We need to run "npm start" instead of "node app.js" to use the extra package "nodemon".