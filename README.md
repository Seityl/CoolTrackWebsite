# Cool Track - Intelligent Temperature Monitoring

Official website for Cool Track, the leading temperature monitoring solution for healthcare, food service, and industrial applications.

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
- **Theme**: Andromeda Light
- **Deployment**: GitHub Actions CI/CD → GitHub Pages
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
├── static/                # Static files (robots.txt, etc.)
├── themes/
│   └── andromeda-light/   # Hugo theme
└── public/                # Generated site (not in repo)
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

The site automatically deploys to GitHub Pages when code is pushed to the `main` branch.

### Manual Deployment

```bash
# Build the site
hugo --minify

# Deploy (GitHub Actions handles this automatically)
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
