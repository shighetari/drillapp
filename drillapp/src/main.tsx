import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import { ReactKeycloakProvider } from '@react-keycloak/web';
import keycloakInstance from './hooks/keycloakInstance';

const root = ReactDOM.createRoot(document.getElementById('root') as HTMLElement);

root.render(
  <React.Fragment>
    <ReactKeycloakProvider authClient={keycloakInstance}>
      <App />
    </ReactKeycloakProvider>
  </React.Fragment>
);
