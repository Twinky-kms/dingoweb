# Use an official Node.js runtime as the base image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and yarn.lock to the working directory
COPY package.json yarn.lock ./

# Install the project dependencies using Yarn
RUN yarn install

# Copy the entire project to the working directory
COPY . /app

# Build the React app for production
RUN yarn build

# Install the serve npm package globally
RUN yarn global add serve

# Specify the command to run when the container starts
CMD [ "serve", "-s", "-l", "3000" ]
