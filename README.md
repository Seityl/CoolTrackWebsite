# Cool Track - Intelligent Temperature Monitoring

Official website for Cool Track, the leading temperature monitoring solution for healthcare, food service, and industrial applications.

## Quick Start

### Website Management

```bash
# Interactive menu for all operations
./manage
```

**Common Commands:**
```bash
./scripts/build.sh               # Rebuild website
./scripts/status.sh              # Check server status
./scripts/maintenance-enable.sh  # Enable maintenance mode
./scripts/maintenance-disable.sh # Disable maintenance mode
```

See [QUICKSTART.md](QUICKSTART.md) for more details.

## Overview

Cool Track provides 24/7 automated temperature monitoring with real-time alerts, cloud logging, and compliance-ready documentation for businesses that can't afford equipment failure or regulatory violations.

## Website Features

- **Homepage**: Compelling hero section with key features and testimonials
- **Features Page**: Comprehensive product feature showcase
- **Industry Solutions**: Tailored pages for Healthcare, Food Service, and Industrial sectors
- **Pricing**: Clear pricing tiers with detailed comparison
- **Blog**: SEO-optimized content on temperature monitoring best practices

## Technology Stack

- **Static Site Generator**: Hugo v0.121.2 (Extended)
- **Web Server**: Caddy v2.10.2 (production)
- **CDN/Tunnel**: Cloudflare Tunnel
- **Theme**: Andromeda Light
- **CI/CD**: GitHub Actions
- **Modules**: Bootstrap SCSS, SEO tools, image optimization

## Local Development

### Prerequisites

- Hugo Extended v0.121.2 or higher
- Go v1.21+ (for Hugo modules)

### Setup

```bash
# Clone the repository
git clone https://github.com/Seityl/CoolTrackWebsite.git
cd CoolTrackWebsite

# Install Hugo modules
hugo mod get
hugo mod tidy

# Start development server
hugo server -D

# Site available at http://localhost:1313
```

### Build for Production

```bash
hugo --minify
```

## Project Structure

```
cooltrack-website/
├── .github/
│   └── workflows/          # CI/CD pipeline
├── assets/                 # SCSS, images, JS
├── config/
│   └── _default/          # Hugo configuration
├── content/
│   └── english/           # Page content
│       ├── _index.md      # Homepage
│       ├── features.md    # Features page
│       ├── pricing.md     # Pricing page
│       ├── blog/          # Blog posts
│       └── industries/    # Industry pages
├── scripts/               # Management scripts
│   ├── manage.sh          # Interactive menu
│   ├── build.sh           # Build site
│   ├── status.sh          # Check status
│   └── maintenance-*.sh   # Maintenance mode scripts
├── static/                # Static files (robots.txt, etc.)
├── themes/
│   └── andromeda-light/   # Hugo theme
├── public/                # Generated site (not in repo)
├── Caddyfile              # Web server config
├── maintenance.html       # Maintenance page
└── manage                 # Quick launcher
```

## Content Management

### Adding a Blog Post

Create a new markdown file in `content/english/blog/`:

```markdown
---
title: "Your Post Title"
description: "SEO description"
date: 2025-11-27T10:00:00-05:00
image: "images/blog/your-image.jpg"
draft: false
author: "author-name"
categories: ["Category"]
tags: ["tag1", "tag2"]
---

Your content here...
```

### Updating Pages

Edit markdown files in `content/english/`:
- `_index.md` - Homepage
- `features.md` - Features page
- `pricing.md` - Pricing page
- `industries/*.md` - Industry-specific pages

## Deployment

### Production Server

The site runs on:
- **Web Server**: Caddy (localhost:8080)
- **CDN**: Cloudflare Tunnel → cooltrack.co
- **SSL**: Automatic via Cloudflare

**Update Workflow:**
```bash
# 1. Enable maintenance mode
./scripts/maintenance-enable.sh

# 2. Pull changes and rebuild
git pull
./scripts/build.sh

# 3. Test locally
curl http://localhost:8080

# 4. Go live
./scripts/maintenance-disable.sh
```

**Cloudflare Tunnel Configuration:**
- Dashboard: https://one.dash.cloudflare.com/ → Access → Tunnels
- Service: `http://localhost:8080`
- Domain: `cooltrack.co`

### Manual Build

```bash
# Build the site
hugo --minify

# Files generated in /public/
```

## SEO

- **Sitemap**: Auto-generated at `/sitemap.xml`
- **Robots.txt**: Located in `/static/robots.txt`
- **Meta Tags**: Configured in `config/_default/params.toml`
- **Keywords**: Optimized for temperature monitoring, FDA compliance, HACCP, etc.

## Configuration

Key configuration files:
- `config/_default/hugo.toml` - Site settings
- `config/_default/params.toml` - Theme parameters, SEO, contact info
- `config/_default/menus.en.toml` - Navigation structure
- `config/_default/module.toml` - Hugo module imports

## Brand Guidelines

- **Primary Color**: #0066CC (Cool Track Blue)
- **Font**: Inter (400, 500, 600, 700)
- **Tone**: Professional, benefit-focused, industry-specific

## Support

For questions or issues, contact:
- Email: support@cooltrack.com
- Website: https://cooltrack.com

## License

© 2025 Cool Track. All rights reserved.
