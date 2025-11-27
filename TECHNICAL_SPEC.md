# Cool Track - Technical Specification Document

## Document Information
- **Version:** 1.0
- **Last Updated:** November 26, 2025
- **Owner:** Technical Lead
- **Status:** Draft

---

## Table of Contents
1. [Architecture Overview](#architecture-overview)
2. [Hugo Configuration](#hugo-configuration)
3. [Theme Customization](#theme-customization)
4. [Component Specifications](#component-specifications)
5. [SEO Implementation](#seo-implementation)
6. [Performance Optimization](#performance-optimization)
7. [Deployment Strategy](#deployment-strategy)
8. [Analytics & Tracking](#analytics--tracking)

---

## Architecture Overview

### Technology Stack

```
┌─────────────────────────────────────────┐
│         Hugo Static Site Generator       │
│         (Extended Edition v0.120+)       │
└─────────────────────────────────────────┘
                    │
        ┌───────────┴───────────┐
        │                       │
┌───────▼────────┐    ┌─────────▼──────────┐
│  Andromeda     │    │   Custom Theme     │
│  Light Theme   │    │   Modifications    │
└───────┬────────┘    └─────────┬──────────┘
        │                       │
        └───────────┬───────────┘
                    │
        ┌───────────▼───────────┐
        │                       │
   ┌────▼────┐  ┌──────▼──────┐ ┌────▼────┐
   │  HTML5  │  │   CSS3      │ │   JS    │
   │         │  │ (Vanilla)   │ │(Vanilla)│
   └────┬────┘  └──────┬──────┘ └────┬────┘
        │              │             │
        └──────────────┼─────────────┘
                       │
              ┌────────▼─────────┐
              │  Static Assets   │
              │  (Optimized)     │
              └──────────────────┘
```

### Directory Structure

```
cooltrack-website/
│
├── archetypes/              # Content templates
│   └── default.md
│
├── assets/                  # Source assets (processed by Hugo)
│   ├── css/
│   │   ├── main.css        # Main stylesheet (imports all)
│   │   ├── variables.css   # CSS custom properties
│   │   ├── base.css        # Reset & base styles
│   │   ├── layout.css      # Layout structures
│   │   ├── components/     # Component styles
│   │   │   ├── navigation.css
│   │   │   ├── hero.css
│   │   │   ├── features.css
│   │   │   ├── pricing.css
│   │   │   ├── forms.css
│   │   │   ├── footer.css
│   │   │   └── buttons.css
│   │   └── utilities.css   # Utility classes
│   │
│   ├── js/
│   │   ├── main.js         # Main JS entry point
│   │   ├── navigation.js   # Navigation functionality
│   │   ├── forms.js        # Form handling
│   │   ├── analytics.js    # Analytics tracking
│   │   └── utils.js        # Utility functions
│   │
│   └── images/             # Source images (optimized by Hugo)
│       ├── hero/
│       ├── features/
│       ├── icons/
│       └── logos/
│
├── content/                 # Markdown content files
│   ├── _index.md           # Homepage
│   ├── features/
│   │   └── _index.md
│   ├── pricing/
│   │   └── _index.md
│   ├── industries/
│   │   ├── _index.md
│   │   ├── healthcare.md
│   │   ├── food-beverage.md
│   │   ├── data-centers.md
│   │   ├── warehousing.md
│   │   └── manufacturing.md
│   ├── about/
│   │   └── _index.md
│   ├── contact/
│   │   └── _index.md
│   └── legal/
│       ├── privacy.md
│       └── terms.md
│
├── data/                    # Data files (YAML, JSON, TOML)
│   ├── features.yaml       # Features data
│   ├── pricing.yaml        # Pricing tiers
│   ├── testimonials.yaml   # Customer testimonials
│   └── faqs.yaml           # FAQ data
│
├── layouts/                 # HTML templates
│   ├── _default/
│   │   ├── baseof.html     # Base template
│   │   ├── list.html       # List page template
│   │   └── single.html     # Single page template
│   │
│   ├── partials/
│   │   ├── head.html       # <head> section
│   │   ├── header.html     # Site header
│   │   ├── navigation.html # Main navigation
│   │   ├── footer.html     # Site footer
│   │   ├── hero.html       # Hero section
│   │   ├── features.html   # Features section
│   │   ├── pricing.html    # Pricing section
│   │   ├── cta.html        # CTA sections
│   │   ├── testimonials.html
│   │   └── contact-form.html
│   │
│   ├── shortcodes/
│   │   ├── button.html     # Button shortcode
│   │   ├── feature-card.html
│   │   ├── icon.html
│   │   └── youtube.html
│   │
│   ├── index.html          # Homepage template
│   ├── features/
│   │   └── list.html
│   ├── pricing/
│   │   └── single.html
│   └── industries/
│       ├── list.html
│       └── single.html
│
├── static/                  # Static files (copied as-is)
│   ├── fonts/              # Web fonts
│   ├── downloads/          # Downloadable files
│   ├── favicon.ico
│   └── robots.txt
│
├── themes/
│   └── andromeda-light/    # Base theme (git submodule)
│
├── config.toml             # Hugo configuration
├── package.json            # Node dependencies (if any)
├── .gitignore
├── .gitmodules             # Theme as submodule
└── README.md
```

---

## Hugo Configuration

### config.toml

```toml
baseURL = "https://cooltrack.io"
languageCode = "en-us"
title = "Cool Track - Intelligent Temperature Monitoring"
theme = "andromeda-light"

# Enable emoji support
enableEmoji = true

# Enable Git info
enableGitInfo = true

# Copyright
copyright = "© 2025 Cool Track. All rights reserved."

# Pagination
paginate = 12

# Build settings
[build]
  writeStats = true

# Output formats
[outputs]
  home = ["HTML", "RSS", "JSON"]
  section = ["HTML", "RSS"]

# Minification
[minify]
  disableCSS = false
  disableHTML = false
  disableJS = false
  disableJSON = false
  disableSVG = false
  disableXML = false
  minifyOutput = true
  
  [minify.tdewolff.html]
    keepWhitespace = false

# Image processing
[imaging]
  resampleFilter = "Lanczos"
  quality = 85
  anchor = "Smart"

# Markup settings
[markup]
  [markup.goldmark]
    [markup.goldmark.renderer]
      unsafe = true
  [markup.highlight]
    style = "monokai"
    lineNos = false
    noClasses = false

# Params - Site-wide parameters
[params]
  description = "Cool Track delivers intelligent temperature monitoring with real-time alerts and comprehensive logging for businesses that need reliable environmental monitoring."
  author = "Cool Track"
  images = ["/images/og-image.jpg"]
  
  # Logo
  logo = "/images/cooltrack-logo.svg"
  logoWidth = "180"
  
  # Contact info
  email = "info@cooltrack.io"
  phone = "+1 (555) 123-4567"
  address = "123 Innovation Drive, Tech City, TC 12345"
  
  # Social media
  [params.social]
    twitter = "cooltrack"
    linkedin = "company/cooltrack"
    facebook = "cooltrack"
    youtube = "cooltrack"
  
  # Analytics
  [params.analytics]
    googleAnalytics = "G-XXXXXXXXXX"
  
  # CTA defaults
  [params.cta]
    primaryText = "Start Free Trial"
    primaryURL = "/contact/?type=trial"
    secondaryText = "Request Demo"
    secondaryURL = "/contact/?type=demo"

# Menu configuration
[menu]
  [[menu.main]]
    name = "Features"
    url = "/features/"
    weight = 1
  
  [[menu.main]]
    name = "Pricing"
    url = "/pricing/"
    weight = 2
  
  [[menu.main]]
    name = "Industries"
    url = "/industries/"
    weight = 3
  
  [[menu.main]]
    name = "About"
    url = "/about/"
    weight = 4
  
  [[menu.main]]
    name = "Contact"
    url = "/contact/"
    weight = 5
  
  # Footer menu
  [[menu.footer]]
    name = "Privacy Policy"
    url = "/legal/privacy/"
    weight = 1
  
  [[menu.footer]]
    name = "Terms of Service"
    url = "/legal/terms/"
    weight = 2

# Taxonomy
[taxonomies]
  tag = "tags"
  category = "categories"
  industry = "industries"

# Privacy settings
[privacy]
  [privacy.googleAnalytics]
    anonymizeIP = true
    respectDoNotTrack = true
  [privacy.youtube]
    privacyEnhanced = true

# Security
[security]
  [security.exec]
    allow = ['^dart-sass-embedded$', '^go$', '^npx$', '^postcss$']
  [security.funcs]
    getenv = ['^HUGO_', '^CI$']
```

---

## Theme Customization

### Andromeda Light Theme Setup

**Installation:**
```bash
# Add theme as git submodule
git submodule add https://github.com/gethugothemes/andromeda-light-hugo.git themes/andromeda-light

# Initialize submodule
git submodule update --init --recursive
```

### Theme Override Strategy

Instead of modifying the theme directly, we'll override specific files in our root `layouts/` directory. This allows us to maintain theme updates while customizing.

**Files to Override:**

1. **layouts/_default/baseof.html** - Base template
2. **layouts/partials/head.html** - Custom meta tags
3. **layouts/partials/header.html** - Navigation customization
4. **layouts/index.html** - Homepage structure
5. **assets/css/** - All custom styles

### Custom Shortcodes

**Button Shortcode** (`layouts/shortcodes/button.html`):
```html
{{- $text := .Get "text" | default "Learn More" -}}
{{- $url := .Get "url" | default "#" -}}
{{- $style := .Get "style" | default "primary" -}}
{{- $size := .Get "size" | default "medium" -}}
{{- $icon := .Get "icon" | default "" -}}

<a href="{{ $url }}" class="btn btn--{{ $style }} btn--{{ $size }}" {{ if .Get "external" }}target="_blank" rel="noopener noreferrer"{{ end }}>
  {{ if $icon }}<span class="btn__icon">{{ $icon }}</span>{{ end }}
  <span class="btn__text">{{ $text }}</span>
</a>
```

**Usage:**
```markdown
{{< button text="Start Free Trial" url="/contact/" style="primary" >}}
{{< button text="Learn More" url="/features/" style="secondary" size="large" >}}
```

**Feature Card Shortcode** (`layouts/shortcodes/feature-card.html`):
```html
{{- $title := .Get "title" -}}
{{- $icon := .Get "icon" -}}
{{- $description := .Inner -}}

<div class="feature-card">
  {{ if $icon }}
  <div class="feature-card__icon">
    {{ partial "icons" (dict "icon" $icon) }}
  </div>
  {{ end }}
  <h3 class="feature-card__title">{{ $title }}</h3>
  <p class="feature-card__description">{{ $description }}</p>
</div>
```

---

## Component Specifications

### Navigation Component

**File:** `layouts/partials/navigation.html`

**Features:**
- Sticky header on scroll
- Mobile hamburger menu
- Dropdown support for sub-menus
- Active state indication
- CTA button in navigation

**HTML Structure:**
```html
<nav class="navigation" role="navigation" aria-label="Main navigation">
  <div class="navigation__container container">
    <div class="navigation__logo">
      <a href="/" aria-label="Cool Track Home">
        <img src="{{ .Site.Params.logo }}" alt="Cool Track Logo" width="180" height="40">
      </a>
    </div>
    
    <button class="navigation__toggle" aria-label="Toggle menu" aria-expanded="false">
      <span class="navigation__toggle-icon"></span>
    </button>
    
    <div class="navigation__menu">
      <ul class="navigation__list">
        {{ range .Site.Menus.main }}
        <li class="navigation__item {{ if .HasChildren }}navigation__item--has-dropdown{{ end }}">
          <a href="{{ .URL }}" class="navigation__link {{ if $.IsMenuCurrent "main" . }}is-active{{ end }}">
            {{ .Name }}
          </a>
          {{ if .HasChildren }}
          <ul class="navigation__dropdown">
            {{ range .Children }}
            <li><a href="{{ .URL }}">{{ .Name }}</a></li>
            {{ end }}
          </ul>
          {{ end }}
        </li>
        {{ end }}
      </ul>
      
      <div class="navigation__cta">
        <a href="{{ .Site.Params.cta.primaryURL }}" class="btn btn--primary">
          {{ .Site.Params.cta.primaryText }}
        </a>
      </div>
    </div>
  </div>
</nav>
```

**JavaScript:** `assets/js/navigation.js`
```javascript
'use strict';

class Navigation {
  constructor() {
    this.nav = document.querySelector('.navigation');
    this.toggle = document.querySelector('.navigation__toggle');
    this.menu = document.querySelector('.navigation__menu');
    this.isOpen = false;
    
    this.init();
  }
  
  init() {
    this.bindEvents();
    this.handleScroll();
  }
  
  bindEvents() {
    // Mobile toggle
    this.toggle?.addEventListener('click', () => this.toggleMenu());
    
    // Close on ESC
    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape' && this.isOpen) {
        this.toggleMenu();
      }
    });
    
    // Sticky on scroll
    window.addEventListener('scroll', () => this.handleScroll(), { passive: true });
    
    // Close menu on resize
    window.addEventListener('resize', () => {
      if (window.innerWidth > 1024 && this.isOpen) {
        this.toggleMenu();
      }
    });
  }
  
  toggleMenu() {
    this.isOpen = !this.isOpen;
    this.toggle.setAttribute('aria-expanded', this.isOpen);
    this.menu.classList.toggle('is-open', this.isOpen);
    document.body.classList.toggle('menu-open', this.isOpen);
  }
  
  handleScroll() {
    const scrolled = window.scrollY > 50;
    this.nav.classList.toggle('is-scrolled', scrolled);
  }
}

// Initialize
document.addEventListener('DOMContentLoaded', () => {
  new Navigation();
});
```

### Hero Component

**File:** `layouts/partials/hero.html`

**Variants:**
1. Homepage hero (full height, background image/video)
2. Page hero (reduced height, solid background)

**HTML Structure:**
```html
{{- $title := .title | default .Title -}}
{{- $subtitle := .subtitle | default .Params.description -}}
{{- $image := .image | default .Params.image -}}
{{- $variant := .variant | default "full" -}}

<section class="hero hero--{{ $variant }}">
  {{ if $image }}
  <div class="hero__background">
    {{ $img := resources.Get $image }}
    {{ if $img }}
      {{ $webp := $img.Resize "1920x webp q85" }}
      {{ $jpg := $img.Resize "1920x jpg q85" }}
      <picture>
        <source srcset="{{ $webp.RelPermalink }}" type="image/webp">
        <img src="{{ $jpg.RelPermalink }}" alt="" loading="eager" class="hero__image">
      </picture>
    {{ end }}
  </div>
  {{ end }}
  
  <div class="hero__container container">
    <div class="hero__content">
      <h1 class="hero__title">{{ $title }}</h1>
      {{ with $subtitle }}
      <p class="hero__subtitle">{{ . }}</p>
      {{ end }}
      
      <div class="hero__actions">
        {{ partial "cta-buttons" . }}
      </div>
    </div>
    
    {{ if .demo }}
    <div class="hero__demo">
      {{ partial "product-demo" . }}
    </div>
    {{ end }}
  </div>
</section>
```

### Pricing Table Component

**File:** `layouts/partials/pricing.html`

**Data Structure:** `data/pricing.yaml`
```yaml
tiers:
  - name: "Starter"
    price: 29
    period: "month"
    description: "Perfect for small businesses"
    sensors: "Up to 10"
    features:
      - "Real-time monitoring"
      - "Email alerts"
      - "7-day data history"
      - "Mobile app access"
      - "Basic reporting"
    cta:
      text: "Start Free Trial"
      url: "/contact/?plan=starter"
    popular: false
    
  - name: "Professional"
    price: 99
    period: "month"
    description: "For growing businesses"
    sensors: "Up to 50"
    features:
      - "Everything in Starter"
      - "SMS alerts"
      - "90-day data history"
      - "Advanced analytics"
      - "API access"
      - "Priority support"
    cta:
      text: "Start Free Trial"
      url: "/contact/?plan=professional"
    popular: true
    
  - name: "Enterprise"
    price: "Custom"
    period: ""
    description: "For large organizations"
    sensors: "Unlimited"
    features:
      - "Everything in Professional"
      - "Unlimited data history"
      - "Custom integrations"
      - "Dedicated account manager"
      - "SLA guarantee"
      - "On-premise option"
    cta:
      text: "Contact Sales"
      url: "/contact/?plan=enterprise"
    popular: false

annual_discount: 20
trial_days: 14
```

**Template:**
```html
{{ $pricing := .Site.Data.pricing }}

<div class="pricing">
  <div class="pricing__toggle">
    <label class="pricing__toggle-label">
      <input type="radio" name="billing" value="monthly" checked>
      <span>Monthly</span>
    </label>
    <label class="pricing__toggle-label">
      <input type="radio" name="billing" value="annual">
      <span>Annual <span class="pricing__discount">Save {{ $pricing.annual_discount }}%</span></span>
    </label>
  </div>
  
  <div class="pricing__grid">
    {{ range $pricing.tiers }}
    <div class="pricing-card {{ if .popular }}pricing-card--popular{{ end }}">
      {{ if .popular }}
      <div class="pricing-card__badge">Most Popular</div>
      {{ end }}
      
      <h3 class="pricing-card__name">{{ .name }}</h3>
      <p class="pricing-card__description">{{ .description }}</p>
      
      <div class="pricing-card__price">
        {{ if eq .price "Custom" }}
          <span class="pricing-card__amount">{{ .price }}</span>
        {{ else }}
          <span class="pricing-card__currency">$</span>
          <span class="pricing-card__amount" data-monthly="{{ .price }}" data-annual="{{ mul .price 12 | mul 0.8 | div 12 }}">{{ .price }}</span>
          <span class="pricing-card__period">/{{ .period }}</span>
        {{ end }}
      </div>
      
      <div class="pricing-card__sensors">{{ .sensors }} sensors</div>
      
      <ul class="pricing-card__features">
        {{ range .features }}
        <li>{{ . }}</li>
        {{ end }}
      </ul>
      
      <a href="{{ .cta.url }}" class="btn btn--{{ if .popular }}primary{{ else }}secondary{{ end }} btn--block">
        {{ .cta.text }}
      </a>
    </div>
    {{ end }}
  </div>
  
  <p class="pricing__trial">All plans include a {{ $pricing.trial_days }}-day free trial. No credit card required.</p>
</div>
```

### Contact Form Component

**File:** `layouts/partials/contact-form.html`

**Integration:** Formspree or Netlify Forms

**HTML:**
```html
<form class="contact-form" action="https://formspree.io/f/YOUR_FORM_ID" method="POST" novalidate>
  <div class="form-group">
    <label for="name" class="form-label">Name *</label>
    <input type="text" id="name" name="name" class="form-input" required aria-required="true">
    <span class="form-error" role="alert"></span>
  </div>
  
  <div class="form-group">
    <label for="email" class="form-label">Email *</label>
    <input type="email" id="email" name="email" class="form-input" required aria-required="true">
    <span class="form-error" role="alert"></span>
  </div>
  
  <div class="form-group">
    <label for="company" class="form-label">Company *</label>
    <input type="text" id="company" name="company" class="form-input" required aria-required="true">
    <span class="form-error" role="alert"></span>
  </div>
  
  <div class="form-group">
    <label for="phone" class="form-label">Phone</label>
    <input type="tel" id="phone" name="phone" class="form-input">
  </div>
  
  <div class="form-group">
    <label for="sensors" class="form-label">Number of Sensors Needed</label>
    <select id="sensors" name="sensors" class="form-select">
      <option value="">Select range</option>
      <option value="1-10">1-10</option>
      <option value="11-25">11-25</option>
      <option value="26-50">26-50</option>
      <option value="51-100">51-100</option>
      <option value="100+">100+</option>
    </select>
  </div>
  
  <div class="form-group">
    <label for="industry" class="form-label">Industry</label>
    <select id="industry" name="industry" class="form-select">
      <option value="">Select industry</option>
      <option value="healthcare">Healthcare</option>
      <option value="food-beverage">Food & Beverage</option>
      <option value="data-centers">Data Centers</option>
      <option value="warehousing">Warehousing</option>
      <option value="manufacturing">Manufacturing</option>
      <option value="other">Other</option>
    </select>
  </div>
  
  <div class="form-group">
    <label for="message" class="form-label">Message</label>
    <textarea id="message" name="message" class="form-textarea" rows="4"></textarea>
  </div>
  
  <!-- Honeypot for spam protection -->
  <input type="text" name="_gotcha" style="display:none" tabindex="-1" autocomplete="off">
  
  <div class="form-group">
    <label class="form-checkbox">
      <input type="checkbox" name="privacy" required>
      <span>I agree to the <a href="/legal/privacy/">Privacy Policy</a> *</span>
    </label>
  </div>
  
  <button type="submit" class="btn btn--primary btn--large">Send Message</button>
  
  <div class="form-message form-message--success" role="alert" hidden>
    Thank you! We'll be in touch soon.
  </div>
  
  <div class="form-message form-message--error" role="alert" hidden>
    Something went wrong. Please try again.
  </div>
</form>
```

---

## SEO Implementation

### Meta Tags Template

**File:** `layouts/partials/head.html`

```html
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  {{- $title := .Title -}}
  {{- $description := .Description | default .Summary | default .Site.Params.description -}}
  {{- $image := .Params.image | default .Site.Params.images -}}
  {{- $url := .Permalink -}}
  
  <!-- Title -->
  <title>{{ if .IsHome }}{{ .Site.Title }}{{ else }}{{ $title }} - {{ .Site.Title }}{{ end }}</title>
  
  <!-- Meta Description -->
  <meta name="description" content="{{ $description }}">
  
  <!-- Canonical -->
  <link rel="canonical" href="{{ $url }}">
  
  <!-- Open Graph -->
  <meta property="og:type" content="{{ if .IsPage }}article{{ else }}website{{ end }}">
  <meta property="og:url" content="{{ $url }}">
  <meta property="og:title" content="{{ $title }}">
  <meta property="og:description" content="{{ $description }}">
  <meta property="og:site_name" content="{{ .Site.Title }}">
  {{ with $image }}
  <meta property="og:image" content="{{ . | absURL }}">
  {{ end }}
  
  <!-- Twitter Card -->
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:url" content="{{ $url }}">
  <meta name="twitter:title" content="{{ $title }}">
  <meta name="twitter:description" content="{{ $description }}">
  {{ with $image }}
  <meta name="twitter:image" content="{{ . | absURL }}">
  {{ end }}
  {{ with .Site.Params.social.twitter }}
  <meta name="twitter:site" content="@{{ . }}">
  {{ end }}
  
  <!-- Favicon -->
  <link rel="icon" type="image/x-icon" href="/favicon.ico">
  <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
  
  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&family=Open+Sans:wght@400;600&display=swap">
  
  <!-- Stylesheets -->
  {{ $css := resources.Get "css/main.css" | minify | fingerprint }}
  <link rel="stylesheet" href="{{ $css.RelPermalink }}" integrity="{{ $css.Data.Integrity }}">
  
  <!-- Structured Data -->
  {{ partial "structured-data" . }}
</head>
```

### Structured Data

**File:** `layouts/partials/structured-data.html`

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "Organization",
      "name": "{{ .Site.Title }}",
      "url": "{{ .Site.BaseURL }}",
      "logo": "{{ .Site.Params.logo | absURL }}",
      "description": "{{ .Site.Params.description }}",
      "email": "{{ .Site.Params.email }}",
      "telephone": "{{ .Site.Params.phone }}",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "{{ .Site.Params.address }}"
      },
      "sameAs": [
        {{ with .Site.Params.social.twitter }}"https://twitter.com/{{ . }}",{{ end }}
        {{ with .Site.Params.social.linkedin }}"https://linkedin.com/{{ . }}",{{ end }}
        {{ with .Site.Params.social.facebook }}"https://facebook.com/{{ . }}"{{ end }}
      ]
    },
    {
      "@type": "WebSite",
      "name": "{{ .Site.Title }}",
      "url": "{{ .Site.BaseURL }}",
      "potentialAction": {
        "@type": "SearchAction",
        "target": "{{ .Site.BaseURL }}search?q={search_term_string}",
        "query-input": "required name=search_term_string"
      }
    }
    {{ if .IsPage }}
    ,{
      "@type": "WebPage",
      "name": "{{ .Title }}",
      "url": "{{ .Permalink }}",
      "description": "{{ .Description | default .Summary }}",
      "breadcrumb": {
        "@type": "BreadcrumbList",
        "itemListElement": [
          {{ $url := .Site.BaseURL }}
          {{ range $index, $element := split .RelPermalink "/" }}
            {{ if $element }}
            {
              "@type": "ListItem",
              "position": {{ add $index 1 }},
              "name": "{{ humanize $element }}",
              "item": "{{ $url }}{{ $element }}/"
            }{{ if not (eq $index (sub (len (split $.RelPermalink "/")) 2)) }},{{ end }}
            {{ $url = printf "%s%s/" $url $element }}
            {{ end }}
          {{ end }}
        ]
      }
    }
    {{ end }}
    {{ if eq .Section "pricing" }}
    ,{
      "@type": "SoftwareApplication",
      "name": "{{ .Site.Title }}",
      "applicationCategory": "BusinessApplication",
      "operatingSystem": "Web",
      "offers": [
        {{ range $index, $tier := .Site.Data.pricing.tiers }}
        {
          "@type": "Offer",
          "name": "{{ $tier.name }}",
          "price": "{{ $tier.price }}",
          "priceCurrency": "USD"
        }{{ if not (eq $index (sub (len $.Site.Data.pricing.tiers) 1)) }},{{ end }}
        {{ end }}
      ]
    }
    {{ end }}
  ]
}
</script>
```

### Sitemap Generation

Hugo automatically generates sitemap.xml. Custom configuration in `config.toml`:

```toml
[sitemap]
  changefreq = "weekly"
  filename = "sitemap.xml"
  priority = 0.5
```

Override priorities in front matter:
```yaml
---
title: "Homepage"
sitemap:
  priority: 1.0
  changefreq: daily
---
```

---

## Performance Optimization

### Image Optimization

**Hugo Image Processing:**

```html
{{- $image := resources.Get "images/hero-image.jpg" -}}
{{- $webp := $image.Resize "1920x webp q85" -}}
{{- $jpg := $image.Resize "1920x jpg q85" -}}
{{- $mobile := $image.Resize "768x webp q85" -}}
{{- $tablet := $image.Resize "1024x webp q85" -}}

<picture>
  <source 
    media="(max-width: 767px)" 
    srcset="{{ $mobile.RelPermalink }}" 
    type="image/webp">
  <source 
    media="(max-width: 1023px)" 
    srcset="{{ $tablet.RelPermalink }}" 
    type="image/webp">
  <source 
    srcset="{{ $webp.RelPermalink }}" 
    type="image/webp">
  <img 
    src="{{ $jpg.RelPermalink }}" 
    alt="{{ .alt }}" 
    loading="lazy"
    width="{{ $jpg.Width }}"
    height="{{ $jpg.Height }}">
</picture>
```

### CSS Optimization

**Critical CSS Strategy:**

1. Inline critical CSS in `<head>`
2. Lazy load non-critical CSS
3. Use CSS custom properties for theming
4. Minimize CSS file size

**assets/css/critical.css** (inlined):
```css
/* Above-the-fold styles only */
:root { /* variables */ }
.navigation { /* header styles */ }
.hero { /* hero styles */ }
```

**Load strategy:**
```html
<!-- Critical CSS (inlined) -->
<style>{{ (resources.Get "css/critical.css" | minify).Content | safeCSS }}</style>

<!-- Full CSS (deferred) -->
<link rel="preload" href="{{ $css.RelPermalink }}" as="style" onload="this.onload=null;this.rel='stylesheet'">
<noscript><link rel="stylesheet" href="{{ $css.RelPermalink }}"></noscript>
```

### JavaScript Optimization

**Loading Strategy:**

1. Inline critical JS (< 2KB)
2. Defer non-critical JS
3. Use async for independent scripts
4. Bundle and minify

**Template:**
```html
<!-- Critical inline JS -->
<script>
  // Theme toggle, etc.
</script>

<!-- Deferred main JS -->
{{ $js := resources.Get "js/main.js" | minify | fingerprint }}
<script defer src="{{ $js.RelPermalink }}" integrity="{{ $js.Data.Integrity }}"></script>

<!-- Analytics (async) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
```

### Lazy Loading

**Implementation:**

```javascript
// Lazy load images
const imageObserver = new IntersectionObserver((entries, observer) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const img = entry.target;
      img.src = img.dataset.src;
      img.classList.add('loaded');
      observer.unobserve(img);
    }
  });
});

document.querySelectorAll('img[data-src]').forEach(img => {
  imageObserver.observe(img);
});
```

### Resource Hints

```html
<!-- DNS Prefetch -->
<link rel="dns-prefetch" href="https://fonts.googleapis.com">
<link rel="dns-prefetch" href="https://www.google-analytics.com">

<!-- Preconnect -->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<!-- Prefetch -->
<link rel="prefetch" href="/pricing/" as="document">
```

---

## Deployment Strategy

### Recommended Platforms

1. **Netlify** (Recommended)
   - Automatic Hugo builds
   - CDN included
   - Form handling
   - HTTPS free
   - Deploy previews

2. **Vercel**
   - Fast builds
   - Edge network
   - Analytics

3. **GitHub Pages**
   - Free hosting
   - GitHub Actions for CI/CD

### Netlify Configuration

**netlify.toml:**
```toml
[build]
  publish = "public"
  command = "hugo --gc --minify"

[build.environment]
  HUGO_VERSION = "0.120.0"
  HUGO_ENV = "production"
  HUGO_ENABLEGITINFO = "true"

[context.production.environment]
  HUGO_ENV = "production"

[context.deploy-preview]
  command = "hugo --gc --minify --buildFuture -b $DEPLOY_PRIME_URL"

[context.branch-deploy]
  command = "hugo --gc --minify -b $DEPLOY_PRIME_URL"

[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "DENY"
    X-XSS-Protection = "1; mode=block"
    X-Content-Type-Options = "nosniff"
    Referrer-Policy = "strict-origin-when-cross-origin"

[[headers]]
  for = "*.css"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"

[[headers]]
  for = "*.js"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"

[[headers]]
  for = "*.jpg"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"

[[headers]]
  for = "*.png"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"

[[headers]]
  for = "*.webp"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"

[[redirects]]
  from = "/home"
  to = "/"
  status = 301

# Forms
[[plugins]]
  package = "netlify-plugin-submit-sitemap"

  [plugins.inputs]
    baseUrl = "https://cooltrack.io"
    sitemapPath = "/sitemap.xml"
    providers = [
      "google",
      "bing"
    ]
```

### GitHub Actions Workflow

**.github/workflows/deploy.yml:**
```yaml
name: Deploy Hugo Site

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
        with:
          submodules: true
          fetch-depth: 0
      
      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: '0.120.0'
          extended: true
      
      - name: Build
        run: hugo --gc --minify
      
      - name: Run HTML validation
        uses: Cyb3r-Jak3/html5validator-action@v7.2.0
        with:
          root: public/
      
      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        if: github.ref == 'refs/heads/main'
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
```

---

## Analytics & Tracking

### Google Analytics 4 Setup

**File:** `layouts/partials/analytics.html`

```html
{{ if .Site.Params.analytics.googleAnalytics }}
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id={{ .Site.Params.analytics.googleAnalytics }}"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', '{{ .Site.Params.analytics.googleAnalytics }}', {
    'anonymize_ip': true,
    'cookie_flags': 'SameSite=None;Secure'
  });
</script>
{{ end }}
```

### Event Tracking

**File:** `assets/js/analytics.js`

```javascript
'use strict';

class Analytics {
  constructor() {
    this.trackCTAClicks();
    this.trackFormSubmissions();
    this.trackScrollDepth();
  }
  
  track(eventName, parameters = {}) {
    if (typeof gtag === 'function') {
      gtag('event', eventName, parameters);
    }
  }
  
  trackCTAClicks() {
    document.querySelectorAll('[data-track-cta]').forEach(button => {
      button.addEventListener('click', (e) => {
        this.track('cta_click', {
          'cta_text': e.target.textContent.trim(),
          'cta_location': button.dataset.trackCta || 'unknown'
        });
      });
    });
  }
  
  trackFormSubmissions() {
    document.querySelectorAll('form').forEach(form => {
      form.addEventListener('submit', () => {
        this.track('form_submission', {
          'form_id': form.id || 'contact_form'
        });
      });
    });
  }
  
  trackScrollDepth() {
    const milestones = [25, 50, 75, 100];
    let tracked = [];
    
    window.addEventListener('scroll', () => {
      const scrollPercentage = (window.scrollY + window.innerHeight) / document.documentElement.scrollHeight * 100;
      
      milestones.forEach(milestone => {
        if (scrollPercentage >= milestone && !tracked.includes(milestone)) {
          tracked.push(milestone);
          this.track('scroll_depth', {
            'percentage': milestone
          });
        }
      });
    }, { passive: true });
  }
}

// Initialize
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', () => new Analytics());
} else {
  new Analytics();
}
```

---

## Testing Checklist

### Pre-Launch Testing

- [ ] **Functionality**
  - All links work (internal and external)
  - Forms submit successfully
  - Navigation works on all pages
  - Mobile menu functions correctly
  - No JavaScript errors in console

- [ ] **Performance**
  - Lighthouse score > 90 (all metrics)
  - Page load time < 2 seconds
  - Images optimized (WebP)
  - CSS/JS minified
  - Lazy loading implemented

- [ ] **SEO**
  - Unique meta titles/descriptions
  - Structured data validates
  - Sitemap generated
  - Robots.txt configured
  - Canonical URLs set

- [ ] **Accessibility**
  - WAVE: 0 errors
  - Keyboard navigation works
  - Color contrast AA compliant
  - Alt text on all images
  - Proper heading hierarchy

- [ ] **Browser Compatibility**
  - Chrome (latest)
  - Firefox (latest)
  - Safari (latest)
  - Edge (latest)
  - Mobile browsers

- [ ] **Responsive**
  - Mobile (320px - 767px)
  - Tablet (768px - 1023px)
  - Desktop (1024px+)
  - Touch-friendly buttons

---

**Document Version:** 1.0  
**Last Updated:** November 26, 2025  
**Next Review:** Development Phase Start
