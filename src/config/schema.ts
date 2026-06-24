/**
 * JSON-LD structured data builders.
 * Emits a connected @graph: RealEstateAgent (extends LocalBusiness),
 * Person (Austin Jones), and WebSite — the core local-SEO entities.
 */
import { SITE_URL, BRAND, NAP, AREAS_SERVED, SOCIAL } from './site';

const ORG_ID = `${SITE_URL}/#realestateagent`;
const PERSON_ID = `${SITE_URL}/#austin`;
const WEBSITE_ID = `${SITE_URL}/#website`;

const postalAddress = {
  '@type': 'PostalAddress',
  streetAddress: NAP.street,
  addressLocality: NAP.city,
  addressRegion: NAP.region,
  postalCode: NAP.postalCode,
  addressCountry: NAP.country,
};

const areaServed = AREAS_SERVED.map((name) => ({
  '@type': 'City',
  name: `${name}, TX`,
}));

/** RealEstateAgent is a subtype of LocalBusiness — satisfies both schema asks. */
export function realEstateAgentSchema() {
  return {
    '@type': ['RealEstateAgent', 'LocalBusiness'],
    '@id': ORG_ID,
    name: BRAND.name,
    legalName: BRAND.legalName,
    description: `${BRAND.name} — Houston & Pasadena, TX real estate led by Austin Jones ("Austin from Houston"), brokered by ${BRAND.brokerage}. Residential, multifamily, retail, industrial, and land.`,
    url: `${SITE_URL}/`,
    telephone: NAP.phone,
    email: NAP.email,
    image: `${SITE_URL}/og-default.png`,
    logo: `${SITE_URL}/logo.png`,
    priceRange: '$$',
    address: postalAddress,
    geo: {
      '@type': 'GeoCoordinates',
      latitude: NAP.latitude,
      longitude: NAP.longitude,
    },
    areaServed,
    founder: { '@id': PERSON_ID },
    employee: { '@id': PERSON_ID },
    parentOrganization: {
      '@type': 'Organization',
      name: BRAND.brokerage,
    },
    sameAs: Object.values(SOCIAL),
    openingHoursSpecification: [
      {
        '@type': 'OpeningHoursSpecification',
        dayOfWeek: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
        opens: '08:00',
        closes: '18:00',
      },
    ],
  };
}

export function personSchema() {
  return {
    '@type': 'Person',
    '@id': PERSON_ID,
    name: BRAND.owner,
    alternateName: BRAND.ownerNickname,
    jobTitle: 'Real Estate Agent & Investor',
    description: `${BRAND.owner}, known as "${BRAND.ownerNickname}," is the owner/operator of ${BRAND.name}, serving Houston and Pasadena, TX across residential, multifamily, retail, industrial, and land.`,
    image: `${SITE_URL}/team/austin-jones.svg`,
    url: `${SITE_URL}/austin-from-houston/`,
    worksFor: { '@id': ORG_ID },
    homeLocation: {
      '@type': 'Place',
      address: { '@type': 'PostalAddress', addressLocality: 'Houston', addressRegion: 'TX' },
    },
    sameAs: Object.values(SOCIAL),
  };
}

export function websiteSchema() {
  return {
    '@type': 'WebSite',
    '@id': WEBSITE_ID,
    url: `${SITE_URL}/`,
    name: BRAND.name,
    publisher: { '@id': ORG_ID },
    inLanguage: 'en-US',
  };
}

/** Default graph used site-wide in <head>. */
export function defaultGraph() {
  return {
    '@context': 'https://schema.org',
    '@graph': [realEstateAgentSchema(), personSchema(), websiteSchema()],
  };
}

/** BreadcrumbList for a page given its trail of {name, url}. */
export function breadcrumbSchema(trail: { name: string; url: string }[]) {
  return {
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: trail.map((c, i) => ({
      '@type': 'ListItem',
      position: i + 1,
      name: c.name,
      item: c.url.startsWith('http') ? c.url : `${SITE_URL}${c.url}`,
    })),
  };
}
