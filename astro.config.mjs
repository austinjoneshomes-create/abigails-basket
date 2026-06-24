// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import tailwindcss from '@tailwindcss/vite';

// Production domain — update here if the live domain differs.
// Drives canonical URLs, sitemap.xml, and Open Graph absolute URLs.
const SITE = 'https://checkmatere.com';

export default defineConfig({
  site: SITE,
  output: 'static',
  integrations: [
    sitemap({
      changefreq: 'weekly',
      priority: 0.7,
      lastmod: new Date(),
    }),
  ],
  vite: {
    plugins: [tailwindcss()],
  },
});
