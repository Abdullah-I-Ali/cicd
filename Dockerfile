# Use lightweight official Node.js image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package manifests first for optimal layer caching
COPY package*.json ./

# Install production dependencies
RUN npm ci --omit=dev

# Copy the rest of the application code
COPY . .

# Expose application port
EXPOSE 3000

# Set environment variables
ENV NODE_ENV=production
ENV PORT=3000

# Use non-root user provided by node image
USER node

# Start the application
CMD ["node", "index.js"]
