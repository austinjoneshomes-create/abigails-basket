/**
 * Central site configuration — single source of truth for brand, NAP,
 * navigation, and SEO defaults. Update placeholder NAP values once the
 * owner provides real phone / email / address.
 */

export const SITE_URL = 'https://checkmaterealestate.com';

export const BRAND = {
  name: 'Checkmate Real Estate',
  legalName: 'Checkmate Real Estate',
  tagline: 'Your Move in Houston Real Estate',
  owner: 'Austin Jones',
  ownerNickname: 'Austin from Houston',
  brokerage: 'Keller Williams',
  founded: '2019',
} as const;

// NAP (Name / Address / Phone) — PLACEHOLDERS. Must match Google Business
// Profile, KW listing, and all citations exactly. Owner to confirm.
export const NAP = {
  // TODO(owner): confirm public-facing phone
  phone: '(713) 555-0142',
  phoneHref: 'tel:+17135550142',
  // TODO(owner): confirm public email
  email: 'austin@checkmaterealestate.com',
  // TODO(owner): confirm office address (Keller Williams Pasadena office?)
  street: '5050 Fairmont Pkwy, Suite 100',
  city: 'Pasadena',
  region: 'TX',
  regionName: 'Texas',
  postalCode: '77505',
  country: 'US',
  latitude: 29.6585,
  longitude: -95.1499,
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
  // TODO(owner): confirm/replace social URLs
  facebook: 'https://www.facebook.com/checkmaterealestate',
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
