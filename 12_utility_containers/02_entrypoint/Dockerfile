FROM node:14-alpine

WORKDIR /app

ENTRYPOINT [ "npm" ]
# If we add a command after the image name on docker run (like "docker run <option> <image> <command>"),
# then this command overwrites the command (the instruction "CMD ...") specified in a Dockerfile.
# For "ENTRYPOINT", whatever you enter after your image name on docker run is appended after the entry point.
# Entry point is the place in a program where the execution of a program begins,
# and where the program has access to command line arguments.
# Here we specify "npm", so we can append any npm command without the prefix "npm" after our image name on docker run.

# Build the image, and create the container and :
#   docker build -t mynpm .
#   docker run -it -v $(pwd):/app mynpm init
# We just append "init", not "npm init", because we have "npm" already in the entry point.

# Install all the dependencies which can be found in package.json.
# Besides, we can add "express" and this would install the express dependency, maybe with "--save",
# which is a flag and  "npm install" accepts it to add express as a package as a dependency to this project:
#   docker run -it -v $(pwd):/app mynpm install express --save
# We see it creates the "node_modules" folder and mirrors that back into our local folder here because of that bind mount.
