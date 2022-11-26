# Use nodejs version 14 alpine
FROM node:14.21.1-alpine3.16

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Set the environment variable and database host
ENV NODE_ENV=production \
    DB_HOST=item-db

# Install any needed packages specified in package.json
RUN npm install --production --unsafe-perm && npm run build

# Make port 8080 available for the container
EXPOSE 8080

# Run the app
CMD ["npm", "start"]