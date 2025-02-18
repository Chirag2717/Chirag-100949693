# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set environment variables
ENV NODE_ENV=production
ENV PORT=8080  

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy the rest of the application files
COPY . .

# Change ownership to avoid permission issues
RUN chown -R node:node /app

# Switch to a non-root user
USER node

# Expose the port Cloud Run expects
EXPOSE 8080

# Start the application
CMD ["node", "src/index.js"]
