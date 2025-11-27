#!/bin/bash

# Create GitHub Issues Script
# This script creates all initial issues for the Cool Track project

REPO_OWNER="Seityl"
REPO_NAME="CoolTrackWebsite"
API_URL="https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}"

# Check if GITHUB_TOKEN is set
if [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: GITHUB_TOKEN environment variable is not set"
    exit 1
fi

echo "📝 Creating GitHub issues for Cool Track project..."
echo ""

# Function to make GitHub API calls
github_api() {
    curl -s -H "Authorization: token ${GITHUB_TOKEN}" \
         -H "Accept: application/vnd.github.v3+json" \
         "$@"
}

# Function to create an issue
create_issue() {
    local title="$1"
    local body="$2"
    local labels="$3"
    local milestone="$4"
    
    local json_body=$(jq -n \
        --arg title "$title" \
        --arg body "$body" \
        --argjson labels "$labels" \
        --arg milestone "$milestone" \
        '{title: $title, body: $body, labels: $labels, milestone: ($milestone | tonumber)}')
    
    result=$(github_api -X POST "${API_URL}/issues" -d "$json_body")
    issue_number=$(echo "$result" | jq -r '.number')
    echo "  ✓ Created issue #${issue_number}: ${title}"
}

# Issue #1: Hugo Extended Installation & Configuration
create_issue \
    "[INFRASTRUCTURE] Hugo Extended Installation & Configuration" \
    "## Description
Install Hugo Extended and configure the base project structure with the Andromeda Light theme.

## Tasks
- [ ] Install Hugo Extended (v0.110.0+)
- [ ] Verify installation with \`hugo version\`
- [ ] Initialize Hugo project structure
- [ ] Add Andromeda Light theme as submodule
- [ ] Configure base \`hugo.toml\` settings
- [ ] Test local development server
- [ ] Document installation process

## Acceptance Criteria
- Hugo server runs successfully at localhost:1313
- Theme loads without errors
- Documentation updated in HUGO_SETUP.md

## Reference
See \`docs/HUGO_SETUP.md\` for detailed instructions" \
    '["infrastructure","phase-1","priority-critical"]' \
    "1"

# Issue #2: CI/CD Pipeline Setup
create_issue \
    "[INFRASTRUCTURE] CI/CD Pipeline Setup" \
    "## Description
Set up GitHub Actions for automated deployment to staging and production.

## Tasks
- [ ] Create \`.github/workflows/deploy.yml\`
- [ ] Configure Hugo build step
- [ ] Set up staging environment (GitHub Pages or Netlify)
- [ ] Configure automatic deployment on push to main
- [ ] Test deployment pipeline
- [ ] Set up production deployment (manual trigger)
- [ ] Configure environment variables

## Acceptance Criteria
- Automated deployment works on push to main
- Staging site is accessible
- Build fails are caught in CI
- Documentation in docs/DEPLOYMENT.md

## Reference
See \`docs/HUGO_SETUP.md\` for deployment options" \
    '["infrastructure","phase-1","priority-high"]' \
    "1"

# Issue #3: Design System Implementation
create_issue \
    "[DESIGN] Design System Implementation" \
    "## Description
Implement the Cool Track design system with custom CSS variables, typography, and component styles.

## Tasks
- [ ] Create \`assets/scss/variables.scss\` with brand colors
- [ ] Define typography scale in CSS
- [ ] Create spacing system (8px base)
- [ ] Implement component styles (buttons, cards, forms)
- [ ] Set up grid system
- [ ] Add responsive breakpoints
- [ ] Test across different screen sizes
- [ ] Document design tokens

## Acceptance Criteria
- All design tokens defined in CSS variables
- Components render correctly
- Mobile-responsive design verified
- Design system documentation complete

## Reference
\`docs/DESIGN_SYSTEM.md\`" \
    '["design","phase-1","priority-high"]' \
    "1"

# Issue #4: Content Structure & Templates
create_issue \
    "[FEATURE] Content Structure & Templates" \
    "## Description
Create the content directory structure and page templates following Hugo best practices.

## Tasks
- [ ] Create content directory structure
- [ ] Define frontmatter schemas for each content type
- [ ] Create page archetypes
- [ ] Set up layouts for different page types
- [ ] Create partial templates (header, footer, CTA blocks)
- [ ] Test content creation workflow
- [ ] Document content guidelines

## Acceptance Criteria
- All content directories created
- Templates work for all page types
- Archetypes allow easy content creation
- Content style guide documented" \
    '["feature","phase-1","priority-high"]' \
    "1"

# Issue #5: Homepage - Hero Section
create_issue \
    "[FEATURE] Homepage - Hero Section" \
    "## Description
Build the homepage hero section with headline, value proposition, CTA buttons, and background.

## Tasks
- [ ] Create hero section HTML structure
- [ ] Implement responsive hero layout
- [ ] Add primary CTA button (\"Start Free Trial\")
- [ ] Add secondary CTA button (\"Schedule Demo\")
- [ ] Optimize hero background image/video
- [ ] Add trust signals (no CC, free trial, setup time)
- [ ] Implement mobile-responsive design
- [ ] Test across browsers

## Acceptance Criteria
- Hero section displays correctly on all devices
- CTAs are prominent and clickable
- Page loads in <2 seconds
- Lighthouse score >90

## Reference
\`docs/CONVERSION_OPTIMIZATION.md\`" \
    '["feature","phase-2","priority-critical"]' \
    "2"

# Issue #6: Homepage - Features Section
create_issue \
    "[FEATURE] Homepage - Features Section" \
    "## Description
Create the features section highlighting key product capabilities with icons and descriptions.

## Tasks
- [ ] Design feature card component
- [ ] Create 6-8 feature cards
- [ ] Add icons for each feature
- [ ] Write benefit-focused copy
- [ ] Implement grid layout (responsive)
- [ ] Add hover effects
- [ ] Optimize icons (SVG format)
- [ ] Test on mobile devices

## Acceptance Criteria
- All features displayed in responsive grid
- Icons load quickly (<10KB each)
- Copy emphasizes benefits, not just features
- Hover states work smoothly" \
    '["feature","phase-2","priority-high"]' \
    "2"

# Issue #7: Homepage - Social Proof Section
create_issue \
    "[FEATURE] Homepage - Social Proof Section" \
    "## Description
Build social proof section with customer logos, testimonials, and statistics.

## Tasks
- [ ] Create customer logo grid (8-12 logos)
- [ ] Design testimonial cards
- [ ] Implement statistics/metrics display
- [ ] Add star ratings to testimonials
- [ ] Optimize logo images (WebP + fallback)
- [ ] Make section responsive
- [ ] Add animations on scroll (optional)

## Acceptance Criteria
- Logos display in clean grid
- Testimonials include photo, name, title, company
- Statistics are prominent and readable
- Section is visually appealing

## Reference
\`docs/CONVERSION_OPTIMIZATION.md\`" \
    '["feature","phase-2","priority-high"]' \
    "2"

# Issue #8: Features Page
create_issue \
    "[FEATURE] Features Page" \
    "## Description
Create detailed features page with in-depth explanations, screenshots, and use cases.

## Tasks
- [ ] Design feature detail layout
- [ ] Create sections for each major feature
- [ ] Add product screenshots
- [ ] Include comparison table (vs competitors)
- [ ] Add feature-specific CTAs
- [ ] Optimize images
- [ ] Implement responsive design

## Acceptance Criteria
- All features explained in detail
- Screenshots show real product UI
- Comparison table is fair and factual
- Page is SEO-optimized" \
    '["feature","phase-2","priority-medium"]' \
    "2"

# Issue #9: Industry Page - Healthcare
create_issue \
    "[FEATURE] Industry Page - Healthcare" \
    "## Description
Create industry-specific landing page for healthcare sector with tailored messaging.

## Tasks
- [ ] Research healthcare temperature monitoring requirements
- [ ] Write industry-specific headline and copy
- [ ] Find/create relevant images (medical refrigerators, etc.)
- [ ] Add healthcare testimonials
- [ ] Include compliance information (FDA, etc.)
- [ ] Add case study section
- [ ] Implement industry-specific CTAs
- [ ] SEO optimization for healthcare keywords

## Acceptance Criteria
- Messaging speaks to healthcare audience
- Compliance requirements highlighted
- Real healthcare customer testimonials
- SEO-optimized for \"pharmacy temperature monitoring\"

## Reference
\`docs/SEO_STRATEGY.md\`" \
    '["feature","content","phase-2","priority-medium"]' \
    "2"

# Issue #10: Industry Page - Food Service
create_issue \
    "[FEATURE] Industry Page - Food Service" \
    "## Description
Create industry-specific landing page for food service & hospitality.

## Tasks
- [ ] Research food service temperature monitoring needs
- [ ] Write food safety-focused copy
- [ ] Find/create restaurant/kitchen images
- [ ] Add food service testimonials
- [ ] Include HACCP compliance information
- [ ] Add restaurant case study
- [ ] Implement CTAs focused on food safety
- [ ] SEO optimization for food service keywords

## Acceptance Criteria
- Messaging addresses food safety concerns
- HACCP compliance prominent
- Restaurant testimonials included
- SEO-optimized for \"restaurant temperature monitoring\"" \
    '["feature","content","phase-2","priority-medium"]' \
    "2"

# Issue #11: Industry Page - Industrial
create_issue \
    "[FEATURE] Industry Page - Industrial" \
    "## Description
Create industry-specific landing page for industrial & manufacturing.

## Tasks
- [ ] Research industrial monitoring requirements
- [ ] Write copy for server rooms, data centers, manufacturing
- [ ] Find/create industrial facility images
- [ ] Add industrial customer testimonials
- [ ] Highlight scalability and enterprise features
- [ ] Add manufacturing case study
- [ ] Implement CTAs for enterprise
- [ ] SEO optimization for industrial keywords

## Acceptance Criteria
- Messaging speaks to IT and operations managers
- Enterprise features highlighted
- Industrial testimonials included
- SEO-optimized for \"data center temperature monitoring\"" \
    '["feature","content","phase-2","priority-medium"]' \
    "2"

# Issue #12: Pricing Page
create_issue \
    "[FEATURE] Pricing Page" \
    "## Description
Create pricing page with plan comparison, FAQ, and conversion-optimized CTAs.

## Tasks
- [ ] Design pricing card component
- [ ] Create 3-4 pricing tiers
- [ ] Add feature comparison table
- [ ] Highlight \"Most Popular\" plan
- [ ] Add FAQ section
- [ ] Include money-back guarantee
- [ ] Add CTAs for each plan
- [ ] Implement annual billing toggle

## Acceptance Criteria
- Pricing is clear and easy to understand
- Comparison table shows plan differences
- FAQ addresses common objections
- CTAs are conversion-optimized

## Reference
\`docs/CONVERSION_OPTIMIZATION.md\`" \
    '["feature","phase-2","priority-high"]' \
    "2"

# Issue #13: SEO Foundation Implementation
create_issue \
    "[SEO] SEO Foundation Implementation" \
    "## Description
Implement core SEO elements including meta tags, schema markup, sitemap, and analytics.

## Tasks
- [ ] Add meta tags to all pages (title, description, keywords)
- [ ] Implement Open Graph tags
- [ ] Add Twitter Card tags
- [ ] Implement schema.org structured data (Organization, Product, FAQ)
- [ ] Configure sitemap.xml
- [ ] Create robots.txt
- [ ] Set up Google Analytics 4
- [ ] Set up Google Search Console
- [ ] Verify all SEO elements with tools

## Acceptance Criteria
- All pages have unique, optimized meta tags
- Schema markup validates in Google's Rich Results Test
- Sitemap accessible at /sitemap.xml
- Analytics tracking verified

## Reference
\`docs/SEO_STRATEGY.md\`" \
    '["seo","phase-3","priority-critical"]' \
    "3"

# Issue #14: Homepage Content Writing
create_issue \
    "[CONTENT] Homepage Content Writing" \
    "## Description
Write compelling, SEO-optimized copy for the homepage.

## Tasks
- [ ] Write hero headline (H1)
- [ ] Write hero subheading and value proposition
- [ ] Write feature section copy (6-8 features)
- [ ] Write social proof section copy
- [ ] Write FAQ section (8-10 questions)
- [ ] Optimize for primary keywords
- [ ] Ensure readability (Flesch score >60)
- [ ] Review and edit

## Acceptance Criteria
- Copy is clear, concise, benefit-focused
- Primary keyword density 1-2%
- Headlines follow SEO hierarchy (H1 > H2 > H3)
- All copy approved by stakeholders

## Reference
\`docs/CONTENT_STRATEGY.md\`, \`docs/SEO_STRATEGY.md\`" \
    '["content","phase-3","priority-high"]' \
    "3"

# Issue #15: Blog Setup & Initial Posts
create_issue \
    "[FEATURE] Blog Setup & Initial Posts" \
    "## Description
Set up blog structure and write initial SEO-focused blog posts.

## Tasks
- [ ] Create blog layout and templates
- [ ] Set up categories and tags
- [ ] Configure RSS feed
- [ ] Write 5 initial blog posts (1,500+ words each)
- [ ] Optimize posts for target keywords
- [ ] Add featured images
- [ ] Implement author pages
- [ ] Add related posts widget

## Blog Post Topics
1. \"Complete Guide to Temperature Monitoring Systems\"
2. \"How to Choose the Right Temperature Sensor\"
3. \"FDA Temperature Monitoring Requirements Explained\"
4. \"10 Benefits of Wireless Temperature Sensors\"
5. \"Temperature Monitoring ROI: Calculate Your Savings\"

## Acceptance Criteria
- Blog is functional with proper layout
- All 5 posts published and optimized
- Each post targets specific keywords
- Posts include internal links

## Reference
\`docs/SEO_STRATEGY.md\`" \
    '["feature","content","phase-3","priority-medium"]' \
    "3"

# Issue #16: Contact Form Implementation
create_issue \
    "[FEATURE] Contact Form Implementation" \
    "## Description
Create and integrate contact forms for trial signups, demo requests, and general inquiries.

## Tasks
- [ ] Design form layouts (minimal, user-friendly)
- [ ] Implement client-side validation
- [ ] Set up form backend (Formspree/Netlify Forms)
- [ ] Add success/error messages
- [ ] Implement spam protection (reCAPTCHA v3)
- [ ] Test form submissions
- [ ] Set up email notifications
- [ ] Add to CRM integration (if applicable)

## Forms Needed
1. Free Trial Signup (name, email, company)
2. Demo Request (name, email, phone, company, industry, # sensors)
3. Contact Form (name, email, subject, message)
4. Newsletter Signup (email only)

## Acceptance Criteria
- All forms validate correctly
- Submissions captured in backend
- Email notifications working
- Mobile-friendly forms
- No spam submissions

## Reference
\`docs/CONVERSION_OPTIMIZATION.md\`" \
    '["feature","phase-4","priority-high"]' \
    "4"

# Issue #17: Interactive Demo/Calculator
create_issue \
    "[FEATURE] Interactive ROI Calculator" \
    "## Description
Create an interactive ROI calculator to engage visitors and demonstrate value.

## Tasks
- [ ] Design calculator interface
- [ ] Implement calculation logic
- [ ] Add form inputs (# sensors, current costs, etc.)
- [ ] Display results dynamically
- [ ] Add CTA after calculation
- [ ] Make mobile-responsive
- [ ] Test accuracy of calculations

## Acceptance Criteria
- Calculator works correctly
- Results are meaningful and persuasive
- Leads to conversion (email capture or trial signup)
- Mobile-friendly" \
    '["feature","phase-4","priority-medium"]' \
    "4"

# Issue #18: Cross-Browser Testing
create_issue \
    "[TESTING] Cross-Browser Testing" \
    "## Description
Test website across all major browsers and document/fix issues.

## Tasks
- [ ] Test on Chrome (latest 2 versions)
- [ ] Test on Firefox (latest 2 versions)
- [ ] Test on Safari (latest 2 versions)
- [ ] Test on Edge (latest version)
- [ ] Document browser-specific issues
- [ ] Implement fixes/polyfills
- [ ] Retest after fixes
- [ ] Generate QA report

## Acceptance Criteria
- Site works correctly on all browsers
- No console errors
- All features functional
- Visual consistency maintained" \
    '["testing","phase-5","priority-high"]' \
    "5"

# Issue #19: Mobile & Tablet Testing
create_issue \
    "[TESTING] Mobile & Tablet Testing" \
    "## Description
Test responsive design across various mobile and tablet devices.

## Tasks
- [ ] Test on iPhone (multiple sizes)
- [ ] Test on Android phones
- [ ] Test on iPad
- [ ] Test on Android tablets
- [ ] Test landscape/portrait modes
- [ ] Verify touch interactions
- [ ] Check text readability
- [ ] Test form usability on mobile

## Acceptance Criteria
- Fully responsive on all tested devices
- Touch targets meet 48x48px minimum
- Text is readable without zooming
- Forms are easy to complete on mobile" \
    '["testing","phase-5","priority-high"]' \
    "5"

# Issue #20: Performance Optimization
create_issue \
    "[PERFORMANCE] Performance Optimization" \
    "## Description
Optimize site performance to achieve Lighthouse score >90.

## Tasks
- [ ] Run Lighthouse audit
- [ ] Optimize images (WebP, compression, lazy loading)
- [ ] Minify CSS and JavaScript
- [ ] Eliminate render-blocking resources
- [ ] Implement critical CSS
- [ ] Add preconnect/prefetch for fonts
- [ ] Configure caching headers
- [ ] Reduce third-party scripts
- [ ] Re-run Lighthouse and verify

## Acceptance Criteria
- Lighthouse Performance score >90
- First Contentful Paint <1.5s
- Largest Contentful Paint <2.5s
- Cumulative Layout Shift <0.1
- Time to Interactive <3s

## Reference
\`docs/SEO_STRATEGY.md\`" \
    '["performance","phase-5","priority-critical"]' \
    "5"

# Issue #21: Accessibility Audit
create_issue \
    "[ACCESSIBILITY] Accessibility Audit" \
    "## Description
Ensure website meets WCAG 2.1 AA accessibility standards.

## Tasks
- [ ] Run automated accessibility scan (aXe, WAVE)
- [ ] Test with screen reader (NVDA/JAWS)
- [ ] Verify keyboard navigation
- [ ] Check color contrast ratios
- [ ] Verify all images have alt text
- [ ] Test form labels and error messages
- [ ] Check heading hierarchy
- [ ] Fix identified issues
- [ ] Retest and document

## Acceptance Criteria
- WCAG 2.1 AA compliant
- Zero critical accessibility issues
- Screen reader can navigate all content
- Keyboard navigation works throughout
- Color contrast meets 4.5:1 minimum

## Reference
\`docs/DESIGN_SYSTEM.md\`" \
    '["accessibility","phase-5","priority-high"]' \
    "5"

# Issue #22: Analytics & Tracking Setup
create_issue \
    "[INFRASTRUCTURE] Analytics & Tracking Setup" \
    "## Description
Set up comprehensive analytics and conversion tracking.

## Tasks
- [ ] Configure Google Analytics 4
- [ ] Set up conversion goals
- [ ] Implement event tracking (button clicks, form submissions)
- [ ] Set up Google Search Console
- [ ] Configure Google Tag Manager (if using)
- [ ] Add heatmap tool (Hotjar/Clarity)
- [ ] Test all tracking events
- [ ] Create analytics dashboard

## Acceptance Criteria
- All conversion events tracked
- Real-time data visible in GA4
- Search Console receiving data
- Event tracking verified with GA Debugger

## Reference
\`docs/CONVERSION_OPTIMIZATION.md\`" \
    '["infrastructure","phase-6","priority-critical"]' \
    "6"

# Issue #23: Production Deployment
create_issue \
    "[INFRASTRUCTURE] Production Deployment" \
    "## Description
Deploy website to production environment with custom domain.

## Tasks
- [ ] Configure production hosting
- [ ] Set up custom domain DNS
- [ ] Install SSL certificate
- [ ] Deploy site to production
- [ ] Verify deployment
- [ ] Set up CDN (if applicable)
- [ ] Configure caching
- [ ] Set up monitoring/uptime alerts
- [ ] Test production site thoroughly

## Acceptance Criteria
- Site accessible at cooltrack.com
- HTTPS working correctly
- DNS properly configured
- Monitoring alerts configured

## Reference
\`docs/HUGO_SETUP.md\`" \
    '["infrastructure","phase-6","priority-critical"]' \
    "6"

# Issue #24: SEO Submission
create_issue \
    "[SEO] SEO Submission" \
    "## Description
Submit website to search engines and directories.

## Tasks
- [ ] Submit sitemap to Google Search Console
- [ ] Submit to Bing Webmaster Tools
- [ ] Verify site ownership on both platforms
- [ ] Request indexing for key pages
- [ ] Submit to industry directories
- [ ] Set up Google My Business (if applicable)
- [ ] Monitor indexing status

## Acceptance Criteria
- Sitemap submitted to Google and Bing
- Key pages indexed within 7 days
- No indexing errors reported" \
    '["seo","phase-7","priority-high"]' \
    "7"

echo ""
echo "✅ All issues created successfully!"
echo ""
echo "View issues at: https://github.com/${REPO_OWNER}/${REPO_NAME}/issues"
