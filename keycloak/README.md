Refactor Keycloak Server Management and Development Workflow

This commit overhauls the Keycloak server development and management workflow with the addition of several scripts and Docker configuration enhancements, aimed at aligning with best practices and industry standards.

Changes include:

- `Dockerfile`: Revised with best practices, including the use of non-root user, environment variable management, and proper documentation.
- `build_image.sh`: New script for building the Keycloak Docker image with an updated custom theme jar file.
- `start_keycloak.sh`: Script added to start the Keycloak server with persistent data storage, ensuring no data loss between restarts.
- `run_kc.sh`: Streamlined to provide a quick start-up for development purposes without affecting persistent data.
- `update_jar_theme.sh`: Introduced to enable live updating of the Keycloak theme by replacing the theme jar in a running container without downtime.
- `update_keycloak.sh`: Script for updating the Keycloak server with the latest version and custom configurations while minimizing service interruption.
- Directory restructuring: Organized the project directory for better clarity and maintainability.

Each script is equipped with error handling, informative logging, and is designed to execute idempotently to ensure reliability and repeatability of the deployment process.

Additionally, addressed Docker deprecation warnings by recommending the transition to BuildKit for future-proofing image builds.

This configuration paves the way for a robust CI/CD pipeline and facilitates easier transitions between development and production environments.
