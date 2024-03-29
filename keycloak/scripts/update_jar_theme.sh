#!/bin/bash
# Script to update the Keycloak theme JAR in a running container

# Exit on any error
set -e

# Configuration
CONTAINER_NAME="anbu_keycloak_container"
# NEW_THEME_JAR_PATH="/path/to/your/new/theme.jar"  # Change this to the path of the new JAR
NEW_THEME_JAR_PATH="../themes/anbu-v1-keycloak-theme-6.1.5.jar"
THEME_JAR_NAME="anbu-v1-keycloak-theme-6.1.5.jar"  # The name of the JAR inside the container

# Check if the new JAR file exists
if [ ! -f "$NEW_THEME_JAR_PATH" ]; then
  echo "New theme JAR not found: $NEW_THEME_JAR_PATH" ...check the path and try again nub
  exit 1
fi

# Copy the new JAR file into the running container
docker cp "$NEW_THEME_JAR_PATH" "$CONTAINER_NAME:/opt/keycloak/providers/$THEME_JAR_NAME"

echo "New theme JAR has been copied to the container."

# Optionally, restart Keycloak to pick up the new theme
# Lazy is as lazy does
docker exec "$CONTAINER_NAME" /opt/keycloak/bin/kc.sh restart

echo "Theme update is complete."
