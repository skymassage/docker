# With build arguments, we can actually plug in different values into our Dockerfile or image,
# when we build that image without having to hard code these values into the Dockerfile.

FROM node:14

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

# The ARG instruction defines a build arguments that users can pass at build-time
# to the builder using the "docker build" command with the "--build-arg <varname>=<value>"" flag.
# We name this build argument as "PORT_NUM" and assign a default value to 80.
# Again, with a $ sign in front of it to tell Docker that we're referring to some argument or environment variable with this word here.
ARG PORT_NUM=80

ENV PORT $PORT_NUM
# We might want to place ARG and ENV in a place where we need it thereafter, and not place it at the beginning of Dockerfile,
# because these instructions just like all other instructions, add layers to your Dockerfile.
# If we place "ARG PORT_NUM=80" at the beginning of Dockerfile and change the "PORT_NUM" value,
# all subsequent instructions are re-executed when building the new image again.
# And we don't want to execute "npm install" again all the time, which will spend more time building the new image again.
# So we place ARG in a place where we need it thereafter so that we don't spend time executing the instructions before ARG.

EXPOSE $PORT

VOLUME [ "/app/node_modules" ]

CMD [ "npm", "start" ]

# Build the image using "PORT_NUM" of Dockerfile:
# docker build -t feedback-node:1 .
# Build another image by setting "PORT_NUM" in the command:
# docker build -t feedback-node:2 --build-arg PORT_NUM=8000 .
# We can create a container for check:
# docker run -d --rm -p 3000:80 --name feedback-app -v feedback:/app/feedback -v $(pwd):/app feedback-node:1
# docker run -d --rm -p 3000:8000 --name feedback-app -v feedback:/app/feedback -v $(pwd):/app feedback-node:2

# Now we have two images based on the same Dockerfile, where we didn't need to change any code.
# And yet, we're using a different port number, which is then used as a default for the environment variable.
# It can be useful to be able to build different images in a flexible way without having to change the Dockerfile all the time.