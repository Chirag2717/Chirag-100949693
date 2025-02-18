# Use stable Node.js version
FROM node:18-alpine

# Set environment to production
ENV NODE_ENV=production

# Create and set working directory
WORKDIR /app

# Copy package.json first (Improves caching for dependencies)
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy application files after dependencies (Efficient caching)
COPY . .

# Set correct permissions for the node user
RUN chown -R node:node /app

# Set non-root user for security
USER node

# Expose port 8080 (Cloud Run default)
EXPOSE 8080

# Start the Node.js application
CMD ["node", "src/index.js"]
