import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';

export default defineConfig({
  site: 'https://prace-magisterskie.pl',
  integrations: [tailwind()],
});
