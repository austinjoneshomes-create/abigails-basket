# Checkmate Real Estate

Marketing + local-SEO website for **Checkmate Real Estate** — Houston & Pasadena, TX.
Led by **Austin Jones ("Austin from Houston")**, brokered by **Keller Williams**.

Built with **[Astro](https://astro.build)** (static output) + **Tailwind CSS v4**. Ships **zero JavaScript**,
targeting Lighthouse SEO + Performance ≥ 95.

> Note: this branch (`claude/checkmate-real-estate-site-*`) hosts the Checkmate site. The unrelated
> "Abigail's Basket" game still lives on `main` and is untouched.

## Develop

```bash
npm install
npm run dev        # local dev server at http://localhost:4321
npm run build      # static build → ./dist
npm run preview    # preview the production build
```

## Project structure

```
src/
  config/
    site.ts        # ★ single source of truth: brand, NAP, nav, team, asset types
    schema.ts      # JSON-LD builders (RealEstateAgent/LocalBusiness, Person, WebSite, breadcrumbs)
  layouts/Base.astro   # <head> SEO: title/meta/canonical/OG/Twitter + JSON-LD + skip link
  components/      # Header, Footer (NAP), PageHero, CtaBand, ChessMark
  pages/          # Home, About, austin-from-houston, Team, Services (+[slug]), Listings, REI 101, Contact, 404
  styles/global.css    # chess-themed design tokens (@theme)
public/           # favicon.svg, logo.png, og-default.png, robots.txt
```

## Editing content
- **Brand / NAP / team / areas / asset types:** `src/config/site.ts`
- **Production domain:** `astro.config.mjs` → `site` (drives canonical, sitemap, OG URLs)
- **Per-page SEO:** the `title` / `description` / `path` props on each page's `<Base>`

## SEO features built in
- Unique title/meta/canonical/H1 per page; semantic HTML.
- `LocalBusiness` + `RealEstateAgent` + `Person` (Austin) JSON-LD, plus WebSite, BreadcrumbList, FAQ, Service, Podcast.
- `sitemap.xml` (via `@astrojs/sitemap`), `robots.txt`, Open Graph + Twitter cards, 1200×630 OG image.
- Houston/Pasadena location signals across copy, headings, alt text, and footer NAP.

## Deploy
👉 **Full step-by-step (incl. pointing `checkmatere.com` DNS without breaking Gmail): [DEPLOY.md](./DEPLOY.md)**

**Netlify:** connect repo → settings auto-read from `netlify.toml` (build `npm run build`, publish `dist`).
The Contact form is wired for **Netlify Forms** (`data-netlify`).

**Vercel:** config in `vercel.json` (framework `astro`, output `dist`). Add a form backend if not on Netlify.

After deploy, work through **[OFF-SITE-SEO.md](./OFF-SITE-SEO.md)** — the manual, off-site action list.

## Outstanding (owner input — see PLAN.md)
Real NAP, production domain, real photos, TX license #, analytics choice, podcast feed.
Placeholders are clearly marked in `src/config/site.ts`.
