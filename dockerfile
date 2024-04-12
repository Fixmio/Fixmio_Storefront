FROM node:latest

# Set the working directory to /app/medusa
WORKDIR /app/medusa

# Copy package.json and yarn.lock to the working directory
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Build the application
RUN yarn build

# Start the Next.js storefront
CMD ["yarn", "dev"]
