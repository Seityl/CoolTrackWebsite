# Hugo Setup & Deployment Guide

## Overview
This guide provides step-by-step instructions for setting up Hugo with the Andromeda Light theme and deploying the Cool Track website.

## Prerequisites

### Required Software
- **Hugo Extended**: v0.110.0 or later (extended version required for SCSS)
- **Git**: For version control
- **Node.js & npm**: For build tools (optional but recommended)
- **Text editor**: VS Code recommended

### Installation

#### Install Hugo (Linux)
```bash
# Download latest extended version
wget https://github.com/gohugoio/hugo/releases/download/v0.121.0/hugo_extended_0.121.0_linux-amd64.tar.gz

# Extract
tar -xvf hugo_extended_0.121.0_linux-amd64.tar.gz

# Move to /usr/local/bin
sudo mv hugo /usr/local/bin/

# Verify installation
hugo version
```

#### Install Hugo (macOS)
```bash
brew install hugo
```

#### Install Hugo (Windows)
```bash
choco install hugo-extended
```

## Project Setup

### 1. Clone the Repository
```bash
git clone https://github.com/Seityl/CoolTrackWebsite.git
cd CoolTrackWebsite
```

### 2. Install Andromeda Light Theme

```bash
# Add theme as a Git submodule
git submodule add https://github.com/gethugothemes/andromeda-light-hugo.git themes/andromeda-light

# Initialize and update submodules
git submodule init
git submodule update
```

### 3. Copy Example Site Content

```bash
# Copy example content to get started
cp -r themes/andromeda-light/exampleSite/* .

# Keep our existing files (don't overwrite)
# Manually merge config files as needed
```

### 4. Configure Hugo

Edit `config.toml` (or `hugo.toml`):

```toml
baseURL = "https://cooltrack.com/"
languageCode = "en-us"
title = "Cool Track - Intelligent Temperature Monitoring"
theme = "andromeda-light"

# Enable Google Analytics
googleAnalytics = "G-XXXXXXXXXX"

# Enable robots.txt generation
enableRobotsTXT = true

# Pagination
paginate = 12

# Menu configuration
[menu]
  [[menu.main]]
    name = "Home"
    url = "/"
    weight = 1
  
  [[menu.main]]
    name = "Features"
    url = "/features/"
    weight = 2
  
  [[menu.main]]
    name = "Industries"
    url = "/industries/"
    weight = 3
  
  [[menu.main]]
    name = "Pricing"
    url = "/pricing/"
    weight = 4
  
  [[menu.main]]
    name = "Resources"
    url = "/resources/"
    weight = 5
  
  [[menu.main]]
    name = "Contact"
    url = "/contact/"
    weight = 6

# Params for theme
[params]
  description = "Monitor temperature 24/7 with Cool Track's wireless sensor system. Get instant alerts, automated logging, and compliance reporting."
  author = "Cool Track"
  logo = "/images/logo.png"
  logo_width = "150px"
  
  # Contact info
  email = "info@cooltrack.com"
  phone = "+1 (555) 123-4567"
  address = "123 IoT Street, Tech City, TC 12345"
  
  # Social media
  [params.social]
    facebook = "https://facebook.com/cooltrack"
    twitter = "https://twitter.com/cooltrack"
    linkedin = "https://linkedin.com/company/cooltrack"
    youtube = "https://youtube.com/cooltrack"

# Privacy settings
[privacy]
  [privacy.googleAnalytics]
    anonymizeIP = true
    respectDoNotTrack = true

# Outputs
[outputs]
  home = ["HTML", "RSS", "JSON"]
```

## Content Structure

### Directory Layout
```
content/
├── _index.md                 # Homepage
├── features/
│   ├── _index.md            # Features overview
│   ├── real-time-alerts.md
│   ├── data-logging.md
│   └── compliance.md
├── industries/
│   ├── _index.md
│   ├── healthcare.md
│   ├── food-service.md
│   └── industrial.md
├── pricing/
│   └── _index.md
├── resources/
│   ├── _index.md
│   ├── blog/
│   │   ├── post-1.md
│   │   └── post-2.md
│   └── guides/
│       └── getting-started.md
└── contact/
    └── _index.md
```

### Creating Content

#### Homepage (_index.md)
```markdown
---
title: "Intelligent Temperature Monitoring That Never Sleeps"
description: "Monitor temperature 24/7 with Cool Track's wireless sensor system"
draft: false
---

Hero content here...
```

#### Create a New Page
```bash
hugo new features/real-time-alerts.md
```

#### Blog Post Template
```bash
hugo new resources/blog/my-post-title.md
```

```markdown
---
title: "My Blog Post Title"
date: 2025-11-26
draft: false
author: "Cool Track Team"
image: "/images/blog/my-post.jpg"
description: "Brief description for SEO"
categories: ["Temperature Monitoring"]
tags: ["alerts", "iot", "sensors"]
---

Content here...
```

## Static Assets

### Directory Structure
```
static/
├── images/
│   ├── logo.png
│   ├── hero-bg.jpg
│   ├── features/
│   ├── industries/
│   └── blog/
├── css/
│   └── custom.css
├── js/
│   └── custom.js
└── fonts/
```

### Image Optimization
```bash
# Install image optimization tools
npm install -g sharp-cli

# Optimize images
sharp -i input.jpg -o output.jpg -q 80
sharp -i input.jpg -o output.webp

# Bulk convert to WebP
find static/images -name "*.jpg" -exec sh -c 'sharp -i "$1" -o "${1%.jpg}.webp"' _ {} \;
```

## Custom CSS & JS

### Add Custom Styles
Create `assets/scss/custom.scss`:

```scss
// Import theme variables
@import "variables";

// Custom styles
.cta-button {
  background: $primary-color;
  padding: 12px 32px;
  border-radius: 8px;
  
  &:hover {
    transform: translateY(-2px);
  }
}
```

### Add Custom JavaScript
Create `static/js/custom.js`:

```javascript
// Custom scripts
document.addEventListener('DOMContentLoaded', function() {
  // Add your custom JS here
  console.log('Cool Track loaded');
});
```

Include in `layouts/partials/head.html`:
```html
{{ if fileExists "static/js/custom.js" }}
  <script src="{{ "js/custom.js" | relURL }}"></script>
{{ end }}
```

## Development Workflow

### Local Development Server
```bash
# Start development server
hugo server -D

# Server with drafts and live reload
hugo server -D --disableFastRender

# Server accessible from network
hugo server -D --bind 0.0.0.0

# Open browser automatically
hugo server -D --navigateToChanged
```

Access at: `http://localhost:1313`

### Build for Production
```bash
# Build static site
hugo --minify

# Output goes to public/ directory
```

### Performance Optimization
```bash
# Build with minification and cleaning
hugo --minify --gc

# Check build time
hugo --minify --templateMetrics
```

## SEO Configuration

### Enable Sitemap
Hugo automatically generates `sitemap.xml`

### Robots.txt
Create `static/robots.txt`:
```
User-agent: *
Allow: /

Sitemap: https://cooltrack.com/sitemap.xml
```

### Meta Tags Template
Edit `layouts/partials/head.html`:

```html
<meta name="description" content="{{ .Description | default .Site.Params.description }}">
<meta name="keywords" content="{{ delimit .Keywords ", " }}">

<!-- Open Graph -->
<meta property="og:title" content="{{ .Title }}">
<meta property="og:description" content="{{ .Description }}">
<meta property="og:image" content="{{ .Params.image | absURL }}">
<meta property="og:url" content="{{ .Permalink }}">
<meta property="og:type" content="website">

<!-- Twitter Card -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="{{ .Title }}">
<meta name="twitter:description" content="{{ .Description }}">
<meta name="twitter:image" content="{{ .Params.image | absURL }}">
```

## Deployment Options

### Option 1: GitHub Pages

#### Setup GitHub Actions
Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy Hugo Site

on:
  push:
    branches:
      - main
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: recursive
          fetch-depth: 0

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'
          extended: true

      - name: Build
        run: hugo --minify

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v2
        with:
          path: ./public

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v2
```

#### Enable GitHub Pages
1. Go to repository Settings
2. Navigate to Pages
3. Select "GitHub Actions" as source
4. Push to main branch to deploy

### Option 2: Netlify

#### Create `netlify.toml`:
```toml
[build]
  publish = "public"
  command = "hugo --minify"

[build.environment]
  HUGO_VERSION = "0.121.0"
  HUGO_ENV = "production"

[[redirects]]
  from = "/*"
  to = "/404.html"
  status = 404

[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "DENY"
    X-XSS-Protection = "1; mode=block"
    X-Content-Type-Options = "nosniff"
```

#### Deploy Steps:
1. Connect repository to Netlify
2. Configure build settings (auto-detected from netlify.toml)
3. Deploy

### Option 3: Vercel

```json
{
  "build": {
    "env": {
      "HUGO_VERSION": "0.121.0"
    }
  }
}
```

Deploy: `vercel --prod`

### Option 4: AWS S3 + CloudFront

```bash
# Build site
hugo --minify

# Sync to S3
aws s3 sync public/ s3://cooltrack-website --delete

# Invalidate CloudFront cache
aws cloudfront create-invalidation --distribution-id YOUR_DIST_ID --paths "/*"
```

## Custom Shortcodes

### Create Alert Shortcode
Create `layouts/shortcodes/alert.html`:

```html
<div class="alert alert-{{ .Get 0 }}">
  {{ .Inner | markdownify }}
</div>
```

Usage in content:
```markdown
{{< alert "info" >}}
This is an informational alert!
{{< /alert >}}
```

### CTA Button Shortcode
Create `layouts/shortcodes/cta.html`:

```html
<a href="{{ .Get "url" }}" class="btn btn-{{ .Get "type" | default "primary" }}">
  {{ .Get "text" }}
</a>
```

Usage:
```markdown
{{< cta url="/pricing/" text="Start Free Trial" type="primary" >}}
```

## Performance Checklist

### Pre-deployment
- [ ] Enable Hugo minification
- [ ] Optimize all images (WebP + fallback)
- [ ] Remove unused CSS/JS
- [ ] Enable caching headers
- [ ] Compress assets (gzip/brotli)
- [ ] Test page speed (Lighthouse score > 90)
- [ ] Validate HTML
- [ ] Test mobile responsiveness

### Post-deployment
- [ ] Verify sitemap.xml accessible
- [ ] Submit sitemap to Google Search Console
- [ ] Test all internal links
- [ ] Verify analytics tracking
- [ ] Test contact forms
- [ ] Check HTTPS certificate
- [ ] Test across browsers

## Maintenance

### Update Theme
```bash
git submodule update --remote themes/andromeda-light
```

### Update Hugo
```bash
# Check current version
hugo version

# Update (Linux)
wget https://github.com/gohugoio/hugo/releases/download/vX.X.X/hugo_extended_X.X.X_linux-amd64.tar.gz
```

### Backup
```bash
# Backup entire project
tar -czf cooltrack-backup-$(date +%Y%m%d).tar.gz .

# Backup to S3
aws s3 cp cooltrack-backup-$(date +%Y%m%d).tar.gz s3://backups/
```

## Troubleshooting

### Theme Not Loading
```bash
# Reinitialize submodules
git submodule update --init --recursive
```

### Build Errors
```bash
# Clean build cache
hugo --gc

# Verbose output
hugo -v
```

### CSS Not Updating
```bash
# Disable fast render
hugo server --disableFastRender

# Clear browser cache
```

## Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Andromeda Light Theme](https://github.com/gethugothemes/andromeda-light-hugo)
- [Hugo Discourse Forum](https://discourse.gohugo.io/)
- [Hugo Themes](https://themes.gohugo.io/)

## Support

For project-specific issues:
- Create an issue in the GitHub repository
- Follow issue templates
- Include Hugo version and error messages
