import { defineConfig } from 'vite';
import reactRefresh from '@vitejs/plugin-react-refresh';
import { VitePWA } from 'vite-plugin-pwa';
// import fs from "fs";

// https://vitejs.dev/config/
export default defineConfig({
  server: {
    port: Number(process.env['APP_PORT']) || 3000,
    https: true,
    //   https: {
    //     key: fs.readFileSync("/ssl/private.key"),
    //     cert: fs.readFileSync("/ssl/certs.crt"),
    //   },
  },
  plugins: [
    reactRefresh(),
    VitePWA({
      mode: 'development',
      base: '/',
    }),
  ],
});
