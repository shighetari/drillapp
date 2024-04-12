#!/bin/bash

# Check if docker-compose is installed
if ! [ -x "$(command -v docker-compose)" ]; then
  echo 'Error: docker-compose is not installed.' >&2
  exit 1
fi

# Load environment variables
if [ -f .env ]; then
  export $(cat .env | sed 's/#.*//g' | xargs)
else 
  echo ".env file not found"
  exit 1
fi

# Function to gracefully shut down containers
function shutdown() {
    echo "Shutting down containers..."
    docker-compose stop
    exit
}

# Trap CTRL+C, Script Termination
trap shutdown SIGINT SIGTERM

# Start containers
echo "Starting containers..."
docker-compose up -d

echo "Containers are up and running."