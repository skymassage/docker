# Build the frontend React image and create its container (not in the network):
# 	docker build -t goals-react ./frontend
# 	docker run --name goals-frontend --rm -p 3000:3000 -it goals-react

# Explanation for "docker run --name goals-frontend --rm -p 3000:3000 -it goals-react" above:
# 1. Publish the port to interact with this frontend container from our local host machine,
#    so that we can test it in the browser.
# 2. The backend Node code is executed on the server, but the frontend React code isn't.
#    Because we just run the "npm start" command that starts a development server which serves this basic React app,
#    the React code is not executed on the server, but in the browser.
# 2a. We don't need to put the frontend React container into the network, because the part (the development server)
#     which runs in the container doesn't care about the network and doesn't interact with the node API or the database,
#     and the part interacting with the API is not executed in the docker environment.
#     So, here is no need to put this container in the network.
# 2b. Because we don't put this container in the network, we don't use the backend container name "goals-backend" 
#     as the root URL in /frontend/src/App.js when this frontend container want to communicate with the backend container.
#     "goals-backend" doesn't run in the container where docker would be able to translate this,
#     it runs in the browser and the browser has no idea what "goals-backend" should be.
#     So we should use "localhost" the root URL in /frontend/src/App.js, because this is an address the browser can understand.
#     Besides, we need to ensure that the end points on local host can be reached.
#     It means that we still need to publish port 80 on the backend app (because this container is seperated from the network),
#     so that that app is also still available on the local host because our frontend app needs that access.

FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]