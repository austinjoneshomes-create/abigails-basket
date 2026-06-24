# Go Live on Cloudflare Pages → www.checkmatere.com

Free hosting on Cloudflare Pages, with your domain + email staying on Google Workspace / Squarespace.
**Your Gmail will keep working** — the email-safe path below never touches your email records.

Total time: ~15 minutes (plus a short wait for DNS/SSL).

- **Repo:** `austinjoneshomes-create/abigails-basket`
- **Branch to deploy:** `claude/checkmate-real-estate-site-4t7o78`
- **Build command:** `npm run build`  ·  **Output folder:** `dist`

---

## Step 1 — Create a free Cloudflare account
1. Go to https://dash.cloudflare.com/sign-up and sign up (free, no credit card).
2. Verify your email and log in.

## Step 2 — Connect the site (Cloudflare Pages)
1. In the dashboard, left sidebar → **Workers & Pages** → **Create** → **Pages** tab → **Connect to Git**.
2. Authorize **GitHub** and select the repo **`abigails-basket`**.
3. On the setup screen, set:
   - **Production branch:** `claude/checkmate-real-estate-site-4t7o78`
     *(Important — the default `main` branch is a different project. Pick this branch.)*
   - **Framework preset:** **Astro**
   - **Build command:** `npm run build`
   - **Build output directory:** `dist`
4. Click **Save and Deploy**. Cloudflare builds the site (~1–2 min) and gives you a temporary
   address like `checkmate-real-estate.pages.dev`. **Open it and confirm the site looks right.**
   *(Nobody sees this address once your domain is connected — it's just a staging URL.)*

> Note your exact `*.pages.dev` address — you'll need it in Step 4. Mine will be something like
> `checkmate-real-estate.pages.dev` (Cloudflare assigns the exact name).

## Step 3 — Add your domain in Cloudflare Pages
1. Open your new project → **Custom domains** tab → **Set up a custom domain**.
2. Enter **`www.checkmatere.com`** → **Continue**.
3. Cloudflare detects your domain isn't on Cloudflare DNS and shows a **CNAME record** to add at
   your registrar (Squarespace). It looks like:
   - **Type:** CNAME · **Name:** `www` · **Target:** `checkmate-real-estate.pages.dev`
   Keep this tab open — you'll copy that target next.

## Step 4 — Add ONE DNS record at Squarespace (email stays safe)
Your domain's DNS is managed where you bought it via Google Workspace — now **Squarespace Domains**
(https://account.squarespace.com → **Domains** → `checkmatere.com` → **DNS / DNS Settings**).

1. **Add a custom record:**
   - **Type:** `CNAME`
   - **Host / Name:** `www`
   - **Value / Data:** `checkmate-real-estate.pages.dev`  *(the exact target from Step 3)*
2. **Save.**
3. 🔴 **Do NOT touch any `MX` records** (and leave `TXT`/SPF/DKIM/`DMARC` alone too). Those run your
   `Austin@CheckMateRE.com` email. We're only **adding** a `www` record — your email is unaffected.

Back in Cloudflare, the custom domain will switch from "pending" to **Active** once it sees the
record (minutes to ~an hour). Cloudflare then issues a **free SSL certificate** automatically, so
`https://www.checkmatere.com` works with the padlock. ✅

**At this point your site is LIVE at `https://www.checkmatere.com` with clean URLs:**
`/about`, `/team`, `/services`, `/austin-from-houston`, etc.

---

## Step 5 (optional) — Make the bare `checkmatere.com` redirect to `www`
Nice-to-have so someone typing `checkmatere.com` (no www) still lands on the site. You can skip this
and everything still works at `www`. Easiest option:

- In **Squarespace Domains → your domain**, look for **Domain Forwarding / Forwarding** and forward
  `checkmatere.com` → `https://www.checkmatere.com` (permanent / 301).

If Squarespace forwarding gives you trouble, tell me — the rock-solid alternative is moving your
domain's nameservers to Cloudflare (also free), which makes both `www` and the bare domain work
perfectly. That path touches email DNS, so I'd walk you through preserving your Google Workspace
MX records carefully first.

---

## After it's live (5-minute wins)
- [ ] Visit `https://www.checkmatere.com` — confirm padlock + pages load.
- [ ] Send yourself a test email to/from `Austin@CheckMateRE.com` to confirm email still works.
- [ ] Set up the **contact form**: the built-in `data-netlify` form is Netlify-specific and won't
      capture submissions on Cloudflare. Tell me and I'll switch it to a free Cloudflare-friendly
      option (Cloudflare Pages Forms or Formspree) — ~5 min change.
- [ ] Submit `https://www.checkmatere.com/sitemap-index.xml` in Google Search Console.
- [ ] Work through `OFF-SITE-SEO.md` (Google Business Profile first).

## Auto-updates
Every time I push changes to the `claude/checkmate-real-estate-site-4t7o78` branch, Cloudflare
rebuilds and republishes automatically — no extra steps for you.
