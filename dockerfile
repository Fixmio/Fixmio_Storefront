# Use Alpine Linux base image
FROM alpine:latest

# Update package repositories and install Bash
RUN apk update && \
    apk add --no-cache bash

# Set the working directory
WORKDIR /app/medusa

# Copy package.json and yarn.lock to the working directory
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the application
COPY . .

# Build the application
RUN yarn build

# Command to start the Next.js storefront
CMD ["yarn", "dev"]
