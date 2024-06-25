# Lecture 84: Moving the React single page app (SPA), the frontend, into a container.
# Build the frontend image and create its React container:
#   docker build -t goals-react ./frontend
#   docker run --name goals-frontend --rm -p 3000:3000 -it goals-react
# Publish the port 3000 (see in /frontend/app.js) to make the host machine be able to communicate with this frontend container.
# Here we need to run it in interactive mode by adding "-it"  to "docker run" (so don't use "-d" if "-it" exists).
# Because the React project is set up the way that if it doesn't receive the input (or we could say input trigger),
# it immediately stops the server because no one's interested anyways.
# With "control+C" we can get out of the input mode on the React container,
# and then it shuts down automatically if it loses this input signal.

# From the lecture 82~84, we have put all three building blocks (database, backend, frontend) into their own containers.
# Here these containers communicat with each other through our local host machine because we  publish their ports.
# Next, we can put them into the network, and they can automatically communicate with each other just through their container names.

FROM node
# This frontend setup in the end depends on Node. And it's not a Node app, but it uses Node to spin up this development server,
# which serves this React app. Node is also used to optimize the React code and to transform it into code the browser understands.

WORKDIR /app
# We can also name this app since it is a totally different container than the backend, there will be no clash. 

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000
# We don't see the port directly, but by default it's port 3000.

CMD [ "npm", "start" ]
# Run "start" of "scripts" inside of /frontend/package.json by the command "npm start" 
# to use one of the installed dependencies to spin up that development server which hosts this React app during development.