import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react-swc'
// import { keycloakify } from "keycloakify/vite-plugin";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
})
