import { useKeycloak } from '@react-keycloak/web';

function Protected() {
  const { keycloak } = useKeycloak();

  const userDetails = {
    username: keycloak.tokenParsed?.preferred_username,
    email: keycloak.tokenParsed?.email,
    fullName: keycloak.tokenParsed?.name,
    firstName: keycloak.tokenParsed?.given_name,
    lastName: keycloak.tokenParsed?.family_name,
    roles: keycloak.realmAccess?.roles.join(', '),
  };

  return (
    <div>
      <h2>Protected Page</h2>
      <ul>
        {Object.entries(userDetails).map(([key, value]) => (
          <li key={key}>
            <strong>{key.charAt(0).toUpperCase() + key.slice(1)}:</strong> {value || 'Not Available'}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default Protected;
