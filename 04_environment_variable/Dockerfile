# Environment variables help us run the same container based on the same image in different modes, in different configurations.
# The advantage of using environment variables is that we can configure without hard-coded.
FROM node:14

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

# Set the environment variable <key> to the value <value> like this: ENV <key1>=<value1> <key2>=<value2> ...
ENV PORT=80
# Most languages and tools support the environment variables.
# Node (Node.js) let us access the environment variables in our node code on a globally available "process" object,
# and we can access environment variables using "process.env.<NODE_ENV>", where <NODE_ENV> is user-defined.
# We have set a environment variable "process.env.PORT" containing the actual port number
# that should be used to listen on in "server.js".
# And the environment variable "PORT" here corresponds to "process.env.PORT" in "server.js"


# We can also use this environment variable "PORT" here on EXPOSE without hard-code 80.
# And we need to add a dollar sign '$' in front of "PORT", telling Docker that the thing after '$' is the name of an environment variable.
EXPOSE $PORT

# Prevent bind mounts from overwriting the "node_modules" folder created by the "npm install" instruciton above,
# so we add the "-v /app/node_modules" to "docker run".
VOLUME [ "/app/node_modules" ]

CMD [ "npm", "start" ]

# First, build the image:
#   docker build -t feedback-node:env .
# Create a container using the default port 80 from the image:
#   docker run -d --rm -p 3000:80 --name feedback-app -v feedback:/app/feedback -v $(pwd):/app feedback-node:env

# We can also change the PORT value using docker commands without rebuilding the image.
# So we can add the "--env" or "-e" option with an environment variable key-value pair after "docker run".
# And if we have multiple environment variables, you'll simply add multiple "-e" with the key-value pairs, like this:
# "docker run -e <key1>=<value1> -e <key2>=<value2> ..."
# Here we set the environment variable "PORT" equal to 8000:
#   docker run -d --rm -p 3000:8000 --env PORT=8000 --name feedback-app -v feedback:/app/feedback -v $(pwd):/app feedback-node:env

# We can also specify a separate environment variables file in which to set up environment variable key-value pairs
# Often such a file is named ".env", but you don't have to name it like this.
# Instead of adding "ENV PORT=80" in Dockerfile or adding "--env PORT=8000" to "docker run",
# we add the "--env-file" option and the path to the file containing the environment variables:
#   docker run -d --rm -p 3000:8000 --env-file ./.env --name feedback-app -v feedback:/app/feedback -v $(pwd):/app feedback-node:env

# One important note about environment variables and security:
# Depending on which kind of data we're storing in our environment variables,
# we might not want to include the secure data directly in Dockerfile.
# Instead, go for a separate environment variables file which is then only used at runtime (i.e. when using "docker run").
# Otherwise, the values are "baked into the image" and everyone can read these values via "docker history <image>".
# If we use a separate file, the values are not part of the image since we point at that file when we run docker run.
# But make sure don't commit that separate file as part of the source control repository, if we're using source control (Git).