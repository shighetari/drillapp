# Exit on any error
set -e

# Image name and version
IMAGE_NAME="anbu_keycloak_image"
IMAGE_TAG="latest"

# Path to Dockerfile and project root
DOCKERFILE_PATH="../docker/Dockerfile"  # The correct relative path to Dockerfile from scripts directory
PROJECT_ROOT="../"  # The correct relative path to project root from scripts directory

# Building the Docker image
echo "Building the Docker image with tag $IMAGE_NAME:$IMAGE_TAG..."
# Note the changed PROJECT_ROOT to the correct relative path
docker build -t "$IMAGE_NAME:$IMAGE_TAG" -f "$DOCKERFILE_PATH" "$PROJECT_ROOT"

# Confirmation
echo "Docker image $IMAGE_NAME:$IMAGE_TAG built successfully."
