# Lecture 88: Learn about thus demo app

# Lecture: Dockerizing the MongoDB Service
# Creat the Mongo container:
#   docker run --name mongdb --rm -d -p 21017:27017 mongo
# Add "-p" above because as long as the backend API is not dockerized,
# this node API (backend) still talks to the database here when it connects,
# as if it would be running on our local host machine.
# Now if we create a container containing the database, we need to expose this port "27017"
# (27017 is the default MongoDB port and we see it in /backend/app.js) from our container to our local machine.

FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

ENV MONGODB_USERNAME=root
ENV MONGODB_PASSWORD=secret

CMD ["npm", "start"]