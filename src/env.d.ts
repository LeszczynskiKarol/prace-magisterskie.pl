/// <reference path="../.astro/types.d.ts" />

declare function gtag(...args: any[]): void;

declare function openCookieSettings(): void;

interface Window {
  dataLayer: any[];
  gtag: typeof gtag;
  openCookieSettings: typeof openCookieSettings;
}
