# Use a lightweight Node.js image
FROM node:18-alpine

# Set environment variable for production mode
ENV NODE_ENV=production

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies (Only production dependencies)
RUN npm install --only=production

# Copy the rest of the application
COPY . .

# Ensure the correct ownership (optional)
RUN chown -R node:node /app

# Set user to avoid root permissions
USER node

# Expose the correct port
EXPOSE 8080

# Start the application
CMD ["node", "src/index.js"]
