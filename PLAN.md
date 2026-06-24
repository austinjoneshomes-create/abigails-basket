# Checkmate Real Estate — Build Plan

Brand: **Checkmate Real Estate** · Chess-themed identity · Owner/operator: **Austin Jones ("Austin from Houston")** · Brokered by **Keller Williams**
Market: **Houston / Pasadena, TX** · Assets: residential, multifamily, retail, industrial, land
Team: Ona, Sunnie, Caroline Kano · Mira (Director of Marketing) · Podcast: **REI 101**

Stack: **Astro (static output) + Tailwind CSS** · `@astrojs/sitemap` · JSON-LD schema · deploy to Netlify/Vercel.

---

## Phased Tasks

### Phase 0 — Foundation
- [ ] Create PLAN.md with phases + acceptance checklist
- [ ] Scaffold Astro + Tailwind, sitemap integration, base layout, design tokens (chess theme)
- [ ] Shared components: Header/nav, Footer with NAP, SEO `<head>` component, JSON-LD component
- [ ] Site config (site URL, NAP, brand constants) in one place

### Phase 1 — Core Pages
- [ ] Home (`/`) — hero, value prop, asset types, social proof, CTA
- [ ] About / Austin's story (`/about`)
- [ ] `/austin-from-houston` — personal-brand landing page
- [ ] Team (`/team`) — Austin, Ona, Sunnie, Caroline Kano, Mira
- [ ] Services by asset type (`/services` + residential, multifamily, retail, industrial, land)
- [ ] Listings (`/listings`)
- [ ] REI 101 podcast (`/rei-101`)
- [ ] Contact (`/contact`)

### Phase 2 — SEO & Technical
- [ ] Unique title/meta/canonical/H1 per page targeting keywords
- [ ] LocalBusiness + RealEstateAgent + Person (Austin) JSON-LD
- [ ] Open Graph + Twitter Card tags + OG image
- [ ] sitemap.xml + robots.txt
- [ ] Semantic HTML; descriptive alt text with location signals
- [ ] Houston/Pasadena signals across copy, headings, alt, footer NAP
- [ ] Next-gen image handling (SVG art / Astro image optimization)

### Phase 3 — Performance & QA
- [ ] Mobile-first responsive pass
- [ ] Build passes clean; verify output (sitemap, robots, schema present)
- [ ] Lighthouse-readiness review (SEO + Performance ≥ 95 targets)

### Phase 4 — Deploy & Handoff
- [ ] netlify.toml / vercel config for static deploy
- [ ] OFF-SITE-SEO.md — manual off-site SEO checklist
- [ ] Final README with run/deploy instructions

---

## Acceptance Checklist
- [ ] Home, About, Team, Services by asset type, Listings, REI 101, Contact pages
- [ ] Chess-themed but clean, fast, mobile-first; Lighthouse SEO + Performance ≥ 95 (built for)
- [ ] LocalBusiness + RealEstateAgent + Person (Austin) schema (JSON-LD)
- [ ] Unique title/meta/H1 per page targeting keywords; semantic HTML
- [ ] Houston/Pasadena location signals in copy, headings, alt text, footer NAP
- [ ] sitemap.xml, robots.txt, Open Graph tags, fast images (next-gen formats)
- [ ] `/austin-from-houston` page built to own that personal-brand query
- [ ] Deploy-ready (Vercel/Netlify) + off-site SEO action checklist

---

## Decisions Needed From Owner (placeholders in use until provided)
- [ ] Real **NAP**: business phone, public email, street/office address (KW Pasadena office?). Currently placeholders.
- [ ] Production **domain** (assumed `https://checkmaterealestate.com`). Update `astro.config.mjs` `site` if different.
- [ ] Real **photos** (Austin, team, listings). Currently chess-themed SVG placeholders.
- [ ] License #, KW office/MLS details for compliance footer.

## Change Log
- Init: PLAN.md created; stack chosen (Astro + Tailwind).
