import { useKeycloak } from '@react-keycloak/web';
import Protected from './components/Protected';
import Public from './components/Public';

const App = () => {
  const { keycloak, initialized } = useKeycloak();

  if (!initialized) {
    return <div>Loading...</div>;
  }

  return keycloak.authenticated ? <Protected /> : <Public />;
};

export default App;
