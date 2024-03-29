#!/bin/bash
# Exit on any error
set -e

# This script runs a Keycloak container for development purposes
# It uses a Docker volume to mount a custom theme located in the 'themes' directory

echo "Attempting to stop and remove any existing Keycloak containers..."
# Stop and remove any previous container with the same name (if exists)
docker rm -f anbu_keycloak_container || echo "No existing container to remove."

echo "Building the Keycloak Docker image from the Dockerfile..."
# Build the image from the Dockerfile (optional tbh only if you made changes)
# CD to the root woot woot
cd ..
# docker build -t anbu_keycloak_image ../docker
docker build -t anbu_keycloak_image -f docker/Dockerfile .

# The full path to the themes directory / you could also just use commands to cd around but i'm lazy and this is more explicit
THEMES_DIR="/home/anbu/anbu/drillapp/keycloak/themes"

echo "Starting Keycloak container with custom theme..."
# Start Keycloak with volume mounts for custom themes
# -p flag maps port 4000 on the host COPY anbu-v1-keycloak-theme-6.1.5.jar /opt/keycloak/providers/to port 8080 on the container
# -e flag sets environment variables for admin user
# -v flag mounts the custom theme jar from the host to the container
docker run -d --name anbu_keycloak_container \
  -p 4000:8080 \
  -e KEYCLOAK_ADMIN=admin \
  -e KEYCLOAK_ADMIN_PASSWORD=admin \
  -v "${THEMES_DIR}/anbu-v1-keycloak-theme-6.1.5.jar":"/opt/keycloak/providers/anbu-v1-keycloak-theme-6.1.5.jar" \
  anbu_keycloak_image \
  start-dev

# Confirm success
echo "Keycloak is now running with the custom theme on port 4000."
