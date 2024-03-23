import Keycloak from 'keycloak-js';

// Create a singleton instance of Keycloak
const keycloakConfig = {
  url: import.meta.env.VITE_KEYCLOAK_URL as string,
  realm: import.meta.env.VITE_KEYCLOAK_REALM as string,
  clientId: import.meta.env.VITE_KEYCLOAK_CLIENT as string,
};

const keycloakInstance = new Keycloak(keycloakConfig);

export default keycloakInstance;
