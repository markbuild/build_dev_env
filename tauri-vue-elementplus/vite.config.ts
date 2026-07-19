import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";

// Tauri 要求固定端口，方便打包时前后端联调
export default defineConfig(async () => ({
  plugins: [vue()],
  clearScreen: false,
  server: {
    port: 1420,
    strictPort: true,
    watch: {
      ignored: ["**/src-tauri/**"],
    },
  },
}));
