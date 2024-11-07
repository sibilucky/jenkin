# Use the official Node.js image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code into the container
COPY . .

# Expose the application port (e.g., 3000)
EXPOSE 3000

# Command to run your app
CMD ["npm", "start"]
