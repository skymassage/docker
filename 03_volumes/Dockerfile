FROM node:14

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

# The VOLUME instruction:
# VOLUME ["/app/feedback"]
# We can also use the VOLUME instruction to do the same thing,
# so we don't need to add "-v /app/feedback" to "docker run".

# The "/app/feedback" above is the path inside the container, which is mapped to a folder on the host that we don't know exactly.
# Run the container and open the page, and we see the "Title" and "Document Text" fields on the page.
# Try to enter something into these two fields and save them, and then remove the container and create it again. 
# Then go to "<root_URL>/feedback/<something_we_entered_into_the_Title_field>.txt"
# to check whether the data we entered into the "Document Text" field still exists.
# And the data isn't deleted and still exist because it has been save in the host by the volume.

# Here we use a useful extra package "nodemon" (add '"scripts": {"start": "nodemon server.js"}' into "package.json")
# in node JS development to watch the file system, and it will restart the node server whenever a file changed.
# So here we use the command "npm start" instead of "node server.js" to run "start" of "scripts" inside of "package.json".
# Note that we may encounter issues when working with "Bind Mounts" (see "bind_mounts_for_wsl2.pdf").
CMD [ "npm", "start" ]

################################################################################################

# Build the image:
#   docker build -t feedback-node:volume .
# Create the container with volumes and bind mount, where "$(pwd)" means the current path:
#   docker run -d --rm -p 3000:80 --name feedback-app -v feedback:/app/feedback -v $(pwd):/app -v /app/node_modules feedback-node:volume

# When we change something in the host and want these changes to be reflected in the running containers as well,
# we can use bind mount without rebuilding the image. Here we can change ode in the html file of this app for check.
# But we need to pay attention to the following part using bind mount.
# When the image is created, we copy everything into the container's folder and we install all dependencies.
# But if we use the bind mount for the same directory of the image, everything in the container will be overwrite.
# For example, create a image in this folder:
# docker run -p 3000:80 --name feedback-app -v feedback:/app/feedback -v $(pwd):/app feedback-node:volume
# For this commnad above, the "node_modules" folder will be created in the path "/app/node_modules" 
# during the image creation with "npm install" inside of the container.
# And then we use bind mount (-v <absolute_host_path>:/app), it will overwrite everything in "/app" inside of the container,
# except "/app/feedback" for which we created the volume.
# To preserve the installed dependencies, we create anothor volume for "/app/node_modules":
# docker run -p 3000:80 --name feedback-app -v feedback:/app/feedback -v $(pwd):/app -v /app/node_modules feedback-node:volume
# So here, Docker sees that we have two volumes mapped to "/app" and "app/node"modules". 
# In that case, the simple rule Docker has is that the longer the more specific path wins,
# i.e., we can still bind to "/app", but "/app/node_modules" created by the npm install instruction.
# So "/app/node_modules" still survives and will overwrite the folder that's coming in from outside.
# In summary, Docker always evaluates all volumes on a container, and if there are clashes,
# the longer (more detailed) internal path wins.