# Use an official Nodejs runtime as a parent image
FROM node:22-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and the package-lock.json files to the container
COPY package*.json ./

# Install the dependencies 
RUN npm install

# generate client
COPY prisma ./prisma


# Copy the rest of the application code (from source to dest)
COPY . .

# Expose the port that the app runs on
EXPOSE 5003

# Generate Prisma client and start the app
CMD ["sh", "-c", "npx prisma generate && node ./src/server.js"]