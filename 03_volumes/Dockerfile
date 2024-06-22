FROM node:14

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

# The "/app/feedback" below is the path inside the container, which is mapped to a folder on the host that we don't know exactly.
# We can open the page to enter something into the "Title" and "Document Text" fields and save it,
# and then remove the container and create again. 
# Then go to "<root_URL>/feedback/<something_we_entered_into_the_Title_field>.txt" for check.
# The data isn't deleted because it has been save in the host by the volume.

# The VOLUME instruction
# VOLUME ["/app/feedback"] # We can also use the VOLUME instruction to do the same thing
 #do the same thing using the docker command (docker run -v /app/feedback) without this line.

# Here we use a useful extra package (it's added in "package.json") in node JS development to watch the file system,
# and it will restart the node server whenever a file changed. So we change the CMD instruction.
# Note that we may encounter issues when working with "Bind Mounts" (see "bind_mounts_for_wsl2.pdf").
CMD [ "npm", "start" ]

# When we change something in the host and want these changes to be reflected in the running containers as well,
# we can use bind mount without rebuilding the image. Here we can change something in the html file for check.
# But we need to pay attention to the following part using bind mount.
# When the image is created, we copy everything into the container's folder and we install all dependencies.
# But if we use the bind mount for the same directory of the image, everything in the container will be overwrite.
# For example, create a image in this folder:
# docker run -p 3000:80 -v <volume_name>:/app/feedback -v <absolute_host_path>:/app <image>
# For this commnad above, the "node_modules" folder will be created in the path "/app/node_modules" 
# during the image creation with "npm install" inside of the container.
# And then we use bind mount ( -v <absolute_host_path>:/app), it will overwrite everything in "/app" inside of the container,
# except "/app/feedback" for which we created the volume.
# To preserve the installed dependencies, we create anothor volume for "/app/node_modules":
# docker run -p 3000:80 -v <volume_name>:/app/feedback -v <absolute_host_path>:/app -v /app/node_modules <image>
# So here, Docker sees that we have two volumes mapped to "/app" and "app/node"modules". 
# In that case, the simple rule Docker has is that the longer the more specific path wins,
# i.e., we can still bind to "/app", but "/app/node_modules" created by the npm install instruction.
# So "/app/node_modules" still survives and will overwrite the folder that's coming in from outside.
# In summary, Docker always evaluates all volumes on a container, and if there are clashes,
# the longer (more detailed) internal path wins.