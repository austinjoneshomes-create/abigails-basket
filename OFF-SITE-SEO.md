# Off-Site SEO — Manual Action Checklist (Austin)

The site is built to rank for **"Checkmate Real Estate"** and **"Austin from Houston [real estate]"**.
On-page SEO is handled in code. The items below are off-site and require *your* accounts/decisions —
I can't do them for you. Work top to bottom; the first section moves the needle fastest for local search.

> ⚠️ **Use this exact NAP everywhere — byte-for-byte identical** (from your email signature):
>
> ```
> Checkmate Real Estate
> 711 Milby St, Suite 100, Houston, TX 77023
> (281) 729-6604
> Austin@CheckMateRE.com
> Keller Williams Houston Central · Lic. #9009288
> ```
>
> Domain: **https://checkmatere.com**. These values now live in `src/config/site.ts`.

## 1. Google Business Profile (highest impact for local)
- [ ] Create/claim **Google Business Profile** for "Checkmate Real Estate" (category: *Real Estate Agency* + *Real Estate Agent*).
- [ ] Add a second profile or "Austin Jones" agent practitioner listing if KW compliance allows.
- [ ] Use the exact NAP from the site footer. Add service areas: Houston, Pasadena, Deer Park, La Porte, Friendswood, Pearland, League City, Baytown.
- [ ] Add website link (home + `/austin-from-houston/`), hours, logo (`/logo.png`), and 10+ real photos.
- [ ] Turn on messaging; post weekly updates (new listings, REI 101 episodes).
- [ ] Start collecting **reviews** — ask every closed client. Reply to all of them.

## 2. Local Citations / Directories (NAP consistency)
Submit the identical NAP to:
- [ ] Bing Places for Business
- [ ] Apple Business Connect (Apple Maps)
- [ ] Yelp (Real Estate Agents)
- [ ] Zillow agent profile (link to site + reviews)
- [ ] Realtor.com agent profile
- [ ] Homes.com, Trulia, Redfin agent profiles
- [ ] Keller Williams agent directory page (ensure it links to this site)
- [ ] HAR.com (Houston Association of Realtors) profile — high local authority
- [ ] Facebook Business Page, LinkedIn company page, Instagram business profile
- [ ] Local: Houston/Pasadena Chamber of Commerce, BBB

## 3. Google Search Console + Analytics
- [ ] Add & verify the property in **Google Search Console** (DNS or HTML verification).
- [ ] Submit `https://checkmatere.com/sitemap-index.xml`.
- [ ] Add **Bing Webmaster Tools**; import from GSC; submit sitemap.
- [ ] Install analytics (GA4 or a privacy-friendly option like Plausible/Fathom). *Tell me which and I'll wire it in — it's intentionally not added yet to keep Lighthouse at 100.*

## 4. Personal Brand: "Austin from Houston"
- [ ] Use "Austin from Houston" consistently as your handle across Instagram, YouTube, TikTok, LinkedIn.
- [ ] Link every social bio to `https://checkmatere.com/austin-from-houston/`.
- [ ] Get the phrase into 3rd-party bios: REI 101 podcast directories, guest appearances, KW bio.
- [ ] Pursue a **Google Knowledge Panel** for Austin Jones (consistent Person data + notable mentions help).

## 5. REI 101 Podcast (content authority + backlinks)
- [ ] Publish to Apple Podcasts, Spotify, YouTube; link each back to `/rei-101/`.
- [ ] Add real episode list / embeds to `/rei-101/` (send me the feed URL and I'll integrate it).
- [ ] Show notes pages = more indexable Houston-real-estate content. Consider a `/rei-101/episodes/` blog.

## 6. Backlinks & Content (ongoing)
- [ ] Local PR: sponsor/feature in Houston & Pasadena community sites.
- [ ] Guest posts / interviews linking to the site with anchor text "Checkmate Real Estate" or "Austin from Houston".
- [ ] Ask vendors (lenders, inspectors, title) to link to you from their partner pages.
- [ ] Consider a blog/guides section (neighborhood guides, "buying multifamily in Houston") — strong long-tail SEO. I can scaffold this on request.

## 7. Pre-Launch Technical (mostly done in code — verify after deploy)
- [ ] Point the `checkmatere.com` DNS (Google Workspace domain) at Netlify/Vercel; confirm `site` in `astro.config.mjs` matches (set to `https://checkmatere.com`).
- [ ] Set up domain + HTTPS on Netlify/Vercel (auto SSL).
- [ ] Force a single canonical host (www vs non-www redirect — pick one).
- [ ] Run Lighthouse on the live URL; confirm SEO + Performance ≥ 95.
- [ ] Test rich results: https://search.google.com/test/rich-results (LocalBusiness, Person, FAQ should validate).
- [ ] Verify Open Graph with Facebook Sharing Debugger & LinkedIn Post Inspector.

## What I still need from you (remaining placeholders)
1. ✅ ~~Real NAP~~ — pulled from your email signature.
2. ✅ ~~Production domain~~ — checkmatere.com.
3. ✅ ~~TX license # + KW office~~ — Lic. #9009288, Keller Williams Houston Central.
4. **Real photos** (Austin, team, listings) — still chess-themed placeholders.
5. **Social/podcast URLs** — confirm the real Instagram, YouTube, LinkedIn, and REI 101 feed links (currently best-guess placeholders in `src/config/site.ts`).
6. **Analytics decision** — see note in section 3 (GA4 is the default if you want website visitor stats).
