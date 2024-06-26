# Set the base image to latest Node alpine
FROM node:alpine

# Set the working directory for all subsequent commands
WORKDIR /app/storefront

# Copy the package.json and yarn lock files to the working directory
COPY package.json .
COPY yarn.* .

# Run the apk update command to update package information (only needed in Alpine)
RUN apk update

# Install the dependencies
RUN yarn --network-timeout 1000000

# Copy all files in the current directory (.) to the working directory in the container
COPY . .

# Set the default command to run the application in development mode
ENTRYPOINT [ "yarn", "dev"]
