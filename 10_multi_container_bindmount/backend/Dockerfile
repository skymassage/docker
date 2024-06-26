# Lecture 88: Volumes, bind mounts and polishing for the NodeJS container



# There are some files we don't want to copy into the container (like node_modules, Dockerfile, .git),
# so we can add a .dockerignore file including these files.

FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

ENV MONGODB_USERNAME=root
ENV MONGODB_PASSWORD=secret
# ENV MONGODB_USERNAME=root MONGODB_PASSWORD=secret
# Set "MONGODB_USERNAME" and "MONGODB_PASSWORD" to "root" and "secret" respectively as the default values

# CMD ["node", "app.js"]
CMD ["npm", "start"]