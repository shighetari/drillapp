#!/bin/bash
# Exit on any error
set -e

# Keycloak container details
CONTAINER_NAME="anbu_keycloak_container"
IMAGE_NAME="anbu_keycloak_image"
KEYCLOAK_DATA_VOLUME="anbu_keycloak_data"
KEYCLOAK_PORT="4000"
KEYCLOAK_ADMIN="admin"
KEYCLOAK_ADMIN_PASSWORD="admin"

# Function to check if the container exists
container_exists() {
  docker inspect "$CONTAINER_NAME" &>/dev/null
}

# Function to check if the container is running
container_is_running() {
  [ "$(docker inspect -f '{{.State.Running}}' "$CONTAINER_NAME" 2>/dev/null)" == "true" ]
}

# Start or restart Keycloak container
if container_exists; then
  echo "Container $CONTAINER_NAME already exists."

  if container_is_running; then
    echo "Container $CONTAINER_NAME is already running."
  else
    echo "Starting container $CONTAINER_NAME..."
    docker start "$CONTAINER_NAME"
    echo "Container $CONTAINER_NAME started."
  fi
else
  echo "Creating and starting container $CONTAINER_NAME..."

  # Create and start the container with volume for persistence
  docker run -d --name "$CONTAINER_NAME" \
    -p "$KEYCLOAK_PORT":8080 \
    -e KEYCLOAK_ADMIN="$KEYCLOAK_ADMIN" \
    -e KEYCLOAK_ADMIN_PASSWORD="$KEYCLOAK_ADMIN_PASSWORD" \
    -v "$KEYCLOAK_DATA_VOLUME:/opt/keycloak/data" \
    "$IMAGE_NAME" \
    start-dev
  
  echo "Container $CONTAINER_NAME created and started."
fi
