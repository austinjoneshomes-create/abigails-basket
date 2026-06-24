# Checkmate Real Estate — Build Plan

Brand: **Checkmate Real Estate** · Chess-themed identity · Owner/operator: **Austin Jones ("Austin from Houston")** · Brokered by **Keller Williams**
Market: **Houston / Pasadena, TX** · Assets: residential, multifamily, retail, industrial, land
Team: Ona, Sunnie, Caroline Kano · Mira (Director of Marketing) · Podcast: **REI 101**

Stack: **Astro (static output) + Tailwind CSS** · `@astrojs/sitemap` · JSON-LD schema · deploy to Netlify/Vercel.

---

## Phased Tasks

### Phase 0 — Foundation
- [x] Create PLAN.md with phases + acceptance checklist
- [x] Scaffold Astro + Tailwind, sitemap integration, base layout, design tokens (chess theme)
- [x] Shared components: Header/nav, Footer with NAP, SEO `<head>` component, JSON-LD component
- [x] Site config (site URL, NAP, brand constants) in one place

### Phase 1 — Core Pages
- [x] Home (`/`) — hero, value prop, asset types, social proof, CTA
- [x] About / Austin's story (`/about`)
- [x] `/austin-from-houston` — personal-brand landing page
- [x] Team (`/team`) — Austin, Ona, Sunnie, Caroline Kano, Mira
- [x] Services by asset type (`/services` + residential, multifamily, retail, industrial, land)
- [x] Listings (`/listings`)
- [x] REI 101 podcast (`/rei-101`)
- [x] Contact (`/contact`)

### Phase 2 — SEO & Technical
- [x] Unique title/meta/canonical/H1 per page targeting keywords
- [x] LocalBusiness + RealEstateAgent + Person (Austin) JSON-LD
- [x] Open Graph + Twitter Card tags + OG image
- [x] sitemap.xml + robots.txt
- [x] Semantic HTML; descriptive alt text with location signals
- [x] Houston/Pasadena signals across copy, headings, alt, footer NAP
- [x] Next-gen image handling (SVG art / PNG OG via sharp; zero render-blocking JS)

### Phase 3 — Performance & QA
- [x] Mobile-first responsive pass (CSS-only mobile nav, responsive grids)
- [x] Build passes clean; verify output (sitemap, robots, schema, 1 H1/page all confirmed)
- [x] Lighthouse-readiness review (zero JS shipped, 468K total, system fonts → built for ≥95)

### Phase 4 — Deploy & Handoff
- [x] netlify.toml / vercel.json for static deploy (+ Netlify Forms contact)
- [x] OFF-SITE-SEO.md — manual off-site SEO checklist
- [x] Final README with run/deploy instructions

---

## Acceptance Checklist
- [x] Home, About, Team, Services by asset type, Listings, REI 101, Contact pages
- [x] Chess-themed but clean, fast, mobile-first; Lighthouse SEO + Performance ≥ 95 (built for; verify on live URL)
- [x] LocalBusiness + RealEstateAgent + Person (Austin) schema (JSON-LD)
- [x] Unique title/meta/H1 per page targeting keywords; semantic HTML
- [x] Houston/Pasadena location signals in copy, headings, alt text, footer NAP
- [x] sitemap.xml, robots.txt, Open Graph tags, fast images (next-gen formats)
- [x] `/austin-from-houston` page built to own that personal-brand query
- [x] Deploy-ready (Vercel/Netlify) + off-site SEO action checklist

---

## Decisions Needed From Owner (placeholders in use until provided)
- [ ] Real **NAP**: business phone, public email, street/office address (KW Pasadena office?). Currently placeholders in `src/config/site.ts`.
- [ ] Production **domain** (assumed `https://checkmaterealestate.com`). Update `astro.config.mjs` `site` if different.
- [ ] Real **photos** (Austin, team, listings). Currently chess-themed SVG/initials placeholders.
- [ ] License #, KW office/MLS details for compliance footer.
- [ ] Analytics choice (GA4 vs Plausible/Fathom) + REI 101 podcast feed URL.

## Change Log
- Init: PLAN.md created; stack chosen (Astro + Tailwind).
- Foundation: Astro+Tailwind scaffold, design tokens, Header/Footer/SEO/schema components, site config, homepage.
- Pages: About, austin-from-houston (FAQ schema), Team, Services index + 5 asset-type pages, Listings, REI 101, Contact, 404.
- SEO/Deploy: sitemap+robots+OG verified; netlify.toml/vercel.json; OFF-SITE-SEO.md; README. Build clean, 14 pages, 0 JS.
- **Status: all acceptance boxes checked. Remaining items are owner-input placeholders, not build tasks.**
