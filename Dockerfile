# Use a stable Node.js version
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json before installing dependencies
COPY package*.json ./

# Install only production dependencies
RUN npm install --only=production

# Copy remaining application files
COPY . .

# Expose port 8080 (Cloud Run defaults to this port)
EXPOSE 8080

# Start the application
CMD ["node", "src/index.js"]
