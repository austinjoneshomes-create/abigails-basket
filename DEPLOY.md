# Deploy Checkmate Real Estate to **checkmatere.com**

Goal: get the site live on your Google Workspace domain `checkmatere.com`, with HTTPS,
**without breaking your Google Workspace email (Gmail)**.

This is a static Astro site (`npm run build` → `dist/`). It can host anywhere, but the
fastest, free, auto-deploying path is **Netlify** (the repo is already configured for it via
`netlify.toml`). Vercel steps are included as an alternative.

> ⚠️ **Two accounts only you can log into:** the hosting account (Netlify/Vercel) and your
> domain's DNS (Google Workspace → Squarespace Domains). I've prepared everything in the repo;
> the final clicks below need your login. If you give me access I can drive more of it — just say so.

---

## Important context about this repo
- The site lives on branch **`claude/checkmate-real-estate-site-4t7o78`**.
- The repo's `main` branch is a different project (the "Abigail's Basket" game) that already
  auto-deploys to a separate Netlify site. **Don't merge this into `main`** unless you want to
  replace the game.
- Recommended: spin up a **new** Netlify/Vercel site that builds **this branch**. (Cleaner
  long-term: move this site to its own repo named `checkmate-real-estate` — I can do that on request.)

---

## Option A — Netlify (recommended)

### 1. Create the site
1. Go to https://app.netlify.com → **Add new site → Import an existing project → GitHub**.
2. Authorize and pick repo **`austinjoneshomes-create/abigails-basket`**.
3. **Branch to deploy:** `claude/checkmate-real-estate-site-4t7o78`.
4. Build settings (auto-detected from `netlify.toml`, confirm):
   - Build command: `npm run build`
   - Publish directory: `dist`
5. **Deploy site.** You'll get a temporary URL like `random-name.netlify.app` — verify it looks right.

### 2. Add your domain
1. Site → **Domain management → Add a domain** → enter `checkmatere.com`.
2. Netlify will ask you to verify ownership and show DNS targets.

### 3. Point DNS at the registrar (Google Workspace / Squarespace Domains)
Log into the domain registrar for `checkmatere.com` (Google Workspace domains are now managed at
**Squarespace Domains** — domains.google redirects there). Add these records:

| Type | Host / Name | Value | Notes |
|------|-------------|-------|-------|
| A | `@` (apex) | `75.2.60.5` | Netlify's load balancer |
| CNAME | `www` | `<your-site>.netlify.app` | the temp Netlify subdomain from step 1 |

- ✅ **Leave all existing `MX` records untouched** — those route your `Austin@CheckMateRE.com`
  Google Workspace email. Removing them breaks email.
- HTTPS: Netlify auto-provisions a free Let's Encrypt certificate once DNS resolves (a few minutes to a few hours).
- Set `www` → apex (or apex → `www`) redirect in Netlify so you have one canonical host.

> Alternative (simplest, if you're comfortable): switch the domain to **Netlify DNS** by changing
> the nameservers to the four Netlify gives you. Netlify then manages A/CNAME automatically — but
> you must **re-add your Google Workspace MX records** in Netlify DNS, or email will stop. The
> A-record method above is safer because it leaves email DNS alone.

### 4. Contact form (already wired)
The contact form uses **Netlify Forms** (`data-netlify` is in the markup). After the first deploy,
submissions appear under **Site → Forms**. Add a notification email (Austin@CheckMateRE.com) there.

---

## Option B — Vercel (alternative)
1. https://vercel.com → **Add New → Project → Import** `austinjoneshomes-create/abigails-basket`.
2. Set **Production Branch** to `claude/checkmate-real-estate-site-4t7o78` (Settings → Git).
3. Framework preset **Astro** (auto from `vercel.json`); build `npm run build`, output `dist`.
4. **Settings → Domains → Add `checkmatere.com`.** Vercel shows DNS targets:
   - A `@` → `76.76.21.21`
   - CNAME `www` → `cname.vercel-dns.com`
5. Add those at Squarespace Domains; **keep MX records**. SSL is automatic.
6. Note: the Netlify contact form won't work on Vercel — you'd need a form service (Formspree, etc.).

---

## After it's live (quick post-launch checklist)
- [ ] Visit `https://checkmatere.com` — confirm HTTPS padlock and that `www` redirects to apex (or vice-versa).
- [ ] Confirm `astro.config.mjs` `site` = `https://checkmatere.com` (already set).
- [ ] Submit `https://checkmatere.com/sitemap-index.xml` in Google Search Console.
- [ ] Run Lighthouse on the live URL (expect SEO + Performance ≥ 95).
- [ ] Test schema at https://search.google.com/test/rich-results.
- [ ] Work through `OFF-SITE-SEO.md` (Google Business Profile first).
