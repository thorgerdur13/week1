# Specify the Base Image from which you are building
FROM node:carbon

# Set the working directory to /code
WORKDIR /code

# Copy package.json to the image/container
COPY package.json package.json

# Copy app.js to the image/container
COPY app.js app.js

# Install dependencies from npm
RUN npm install

# Establish what should be executed when the Docker image is launching
CMD node app.js