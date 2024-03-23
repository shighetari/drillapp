// Import useKeycloak hook
import { useKeycloak } from '@react-keycloak/web';

function Public() {
  const { keycloak } = useKeycloak();

  const handleLogin = () => {
    keycloak.login();
  };

  return (
    <>
      <p>Public Page</p>
       <button onClick={handleLogin}>Login</button>
    </>
  );
}

export default Public;
