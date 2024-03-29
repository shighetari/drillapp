// import { useState, useEffect } from 'react';
// import keycloakInstance from './keycloakInstance';

// const useAuth = () => {
//   const [isAuthenticated, setIsAuthenticated] = useState(false);
//   const [isAuthReady, setIsAuthReady] = useState(false);
//   const [keycloak, setKeycloak] = useState(keycloakInstance);

//   useEffect(() => {
//     console.log("Keycloak instance:", keycloak);
//     if (!keycloak.authenticated) {
//       keycloak.init({ onLoad: 'check-sso' })
//         .then(authenticated => {
//           setIsAuthenticated(authenticated);
//           setIsAuthReady(true);
//         })
//         .catch((e) => {
//           console.error("Keycloak init error:", e);
//           setIsAuthReady(true);
//         });
//     }
//   }, [keycloak]);

//   return { isAuthenticated, isAuthReady, keycloak };
// };

// export default useAuth;
