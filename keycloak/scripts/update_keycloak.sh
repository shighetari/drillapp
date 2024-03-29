#!/bin/bash
# Update Keycloak to the latest version although this conflicts me due to LTS and stability
# SO USE WITH CAUTION?

IMAGE_NAME="anbu_keycloak_image"
CONTAINER_NAME="anbu_keycloak_container"

# Pull the latest image
docker pull quay.io/keycloak/keycloak:latest

# Rebuild image
./build_image.sh

# Restart the Keycloak container
docker rm -f "$CONTAINER_NAME"
./start_keycloak.sh

echo "Keycloak has been updated and restarted"
