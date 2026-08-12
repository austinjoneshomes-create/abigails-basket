/**
 * Central site configuration — single source of truth for brand, NAP,
 * navigation, and SEO defaults. Update placeholder NAP values once the
 * owner provides real phone / email / address.
 */

export const SITE_URL = 'https://www.checkmatere.com';

export const BRAND = {
  name: 'Checkmate Real Estate',
  legalName: 'Checkmate Real Estate Group',
  tagline: 'Your Move in Houston Real Estate',
  owner: 'Austin Jones',
  ownerNickname: 'Austin from Houston',
  brokerage: 'Keller Williams',
  brokerageOffice: 'Keller Williams Houston Central',
  licenseNumber: '9009288',
  founded: '2019',
} as const;

// NAP (Name / Address / Phone) — sourced from Austin's email signature.
// Must match Google Business Profile, KW listing, and all citations exactly.
export const NAP = {
  phone: '(281) 942-6576',
  phoneHref: 'tel:+12819426576',
  // Austin's direct line — used on his personal /austin-from-houston page.
  directPhone: '(281) 729-6604',
  directPhoneHref: 'tel:+12817296604',
  email: 'Austin@CheckMateRE.com',
  emailHref: 'austin@checkmatere.com',
  street: '711 Milby St, Suite 100',
  city: 'Houston',
  region: 'TX',
  regionName: 'Texas',
  postalCode: '77023',
  country: 'US',
  // Approx. coordinates for 711 Milby St (Houston East End) — refine if needed.
  latitude: 29.7404,
  longitude: -95.3478,
} as const;

export const AREAS_SERVED = [
  'Houston',
  'Pasadena',
  'Deer Park',
  'La Porte',
  'Friendswood',
  'Pearland',
  'League City',
  'Baytown',
  'Harris County',
] as const;

export const SOCIAL = {
  facebook: 'https://www.facebook.com/checkmaterealestategroup',
  // TODO(owner): confirm real Instagram / YouTube / LinkedIn handles
  instagram: 'https://www.instagram.com/austinfromhouston',
  youtube: 'https://www.youtube.com/@rei101',
  linkedin: 'https://www.linkedin.com/in/austinfromhouston',
} as const;

export const NAV = [
  { label: 'Home', href: '/' },
  { label: 'About', href: '/about/' },
  { label: 'Austin from Houston', href: '/austin-from-houston/' },
  { label: 'Team', href: '/team/' },
  { label: 'Services', href: '/services/' },
  { label: 'Listings', href: '/listings/' },
  { label: 'REI 101', href: '/rei-101/' },
  { label: 'Contact', href: '/contact/' },
] as const;

export const TEAM = [
  {
    name: 'Austin Jones',
    slug: 'austin-jones',
    role: 'Owner / Operator · "Austin from Houston"',
    bio: 'Founder of Checkmate Real Estate and host of the REI 101 podcast. An investor-operator who works the full board — residential to industrial — across Houston and Pasadena.',
    initials: 'AJ',
    photo: '/team/austin.jpg',
  },
  {
    name: 'Ona',
    slug: 'ona',
    role: 'Real Estate Agent',
    bio: 'Guides Houston and Pasadena buyers and sellers through every move with patience, local knowledge, and sharp follow-through.',
    initials: 'O',
    photo: '/team/ona.jpg',
  },
  {
    name: 'Sunnie',
    slug: 'sunnie',
    role: 'Real Estate Agent',
    bio: 'Helps families and first-time buyers find their footing across the greater Houston market — from Deer Park to Pearland.',
    initials: 'S',
  },
  {
    name: 'Caroline Kano',
    slug: 'caroline-kano',
    role: 'Real Estate Agent',
    bio: 'Brings a detail-oriented, client-first approach to residential and investment deals throughout Harris County.',
    initials: 'CK',
  },
  {
    name: 'Mira',
    slug: 'mira',
    role: 'Director of Marketing',
    bio: 'Leads brand, content, and the REI 101 podcast — making sure every Checkmate listing and story reaches the right audience across Houston.',
    initials: 'M',
  },
] as const;

export const ASSET_TYPES = [
  {
    slug: 'residential',
    name: 'Residential',
    short: 'Homes, condos & townhomes',
    blurb:
      'Buying or selling a home in Houston or Pasadena? We move decisively to protect your position and your equity.',
  },
  {
    slug: 'multifamily',
    name: 'Multifamily',
    short: 'Duplexes to apartment complexes',
    blurb:
      'Cash-flowing duplexes, fourplexes, and apartment communities across the Houston metro — underwritten like a pro.',
  },
  {
    slug: 'retail',
    name: 'Retail',
    short: 'Strip centers & storefronts',
    blurb:
      'Retail strip centers, pads, and single-tenant net-lease investments along Houston and Pasadena corridors.',
  },
  {
    slug: 'industrial',
    name: 'Industrial',
    short: 'Warehouse, flex & distribution',
    blurb:
      'Warehouse, flex, and distribution space serving the Port of Houston, the Ship Channel, and the broader Gulf Coast.',
  },
  {
    slug: 'land',
    name: 'Land',
    short: 'Lots, acreage & development',
    blurb:
      'Infill lots, raw acreage, and development sites across Harris County and the greater Houston region.',
  },
] as const;
