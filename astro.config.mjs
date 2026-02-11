import { defineConfig } from "astro/config";
import tailwind from "@astrojs/tailwind";

export default defineConfig({
  site: "https://www.prace-magisterskie.pl",
  integrations: [tailwind()],
});
