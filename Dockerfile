# Use Node.js version 18
FROM node:18-slim

# Set the folder inside the container
WORKDIR /app

# Copy your index.js file into that folder
COPY index.js .

# Open the port your server uses
EXPOSE 3000

# The command to start your app
CMD ["node", "index.js"]