# Use a specific version of the official Keycloak base image
FROM quay.io/keycloak/keycloak:24.0.1

# Set environment variables for Keycloak admin user
ENV KEYCLOAK_ADMIN=admin \
    KEYCLOAK_ADMIN_PASSWORD=admin

# Expose the port Keycloak runs on
EXPOSE 8080

# Copy the custom theme jar to the Keycloak deployments directory
COPY ./themes/anbu-v1-keycloak-theme-6.1.5.jar /opt/keycloak/providers/

# Specify the default command and entry point to start Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev"]


