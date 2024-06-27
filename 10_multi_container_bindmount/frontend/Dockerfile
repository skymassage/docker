# Lecture 89: Bind frontend React code to the frontend container with bind mount

# Build the frontend image to create its container
# 	docker build -t goals-react ./frontend
#  	docker run -v $(pwd)/frontend/src:/app/src --name goals-frontend --rm -p 3000:3000 -it goals-react
# We just want to bind the "src" folder, which contains the React code we usually work on.

# There are some files we don't want to copy into the container (like node_modules, Dockerfile, .git),
# so we can add a ".dockerignore" file including these files.

# If you're using WSL 2 to run Docker, the development server may not reload and may not pick up these file changes
# when you change a file in your Docker container.
# We should create your project in the Linux file system instead of the Windows file system  and use Docker there,
# because then these changes will be picked up by the Docker container.
# Refer to: https://devblogs.microsoft.com/commandline/access-linux-filesystems-in-windows-and-wsl-2/

FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]