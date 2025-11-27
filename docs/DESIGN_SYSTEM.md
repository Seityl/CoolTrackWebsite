# Design System & Brand Guidelines

## Brand Overview

### Brand Positioning
Cool Track is a modern, reliable, and intelligent temperature monitoring solution that combines cutting-edge IoT technology with user-friendly design. We position ourselves as the smart, affordable alternative to enterprise solutions.

### Brand Personality
- **Reliable**: Always on, always accurate
- **Intelligent**: Smart alerts, predictive insights
- **Approachable**: Easy to use, friendly support
- **Professional**: Enterprise-grade quality
- **Innovative**: Forward-thinking technology

## Color Palette

### Primary Colors

#### Cool Track Blue (Primary)
- **Hex**: `#0066CC`
- **RGB**: `rgb(0, 102, 204)`
- **Usage**: Primary CTAs, headers, links, brand elements
- **Accessibility**: AA compliant on white backgrounds

#### Deep Blue (Dark)
- **Hex**: `#003D7A`
- **RGB**: `rgb(0, 61, 122)`
- **Usage**: Text headers, navigation, footer
- **Accessibility**: AAA compliant on white backgrounds

### Secondary Colors

#### Cool Cyan (Accent)
- **Hex**: `#00C9FF`
- **RGB**: `rgb(0, 201, 255)`
- **Usage**: Highlights, hover states, icons
- **Accessibility**: Use with caution on white; ensure contrast

#### Fresh Green (Success)
- **Hex**: `#00D97E`
- **RGB**: `rgb(0, 217, 126)`
- **Usage**: Success messages, positive indicators, "active" status
- **Accessibility**: AA compliant on white backgrounds

#### Alert Orange (Warning)
- **Hex**: `#FF9500`
- **RGB**: `rgb(255, 149, 0)`
- **Usage**: Warnings, important notices
- **Accessibility**: AA compliant on white backgrounds

#### Danger Red (Alert)
- **Hex**: `#FF3B30`
- **RGB**: `rgb(255, 59, 48)`
- **Usage**: Errors, critical alerts, temperature violations
- **Accessibility**: AA compliant on white backgrounds

### Neutral Colors

#### Slate (Text)
- **Hex**: `#1A1A1A`
- **RGB**: `rgb(26, 26, 26)`
- **Usage**: Body text, headings
- **Accessibility**: AAA compliant

#### Medium Gray
- **Hex**: `#6B7280`
- **RGB**: `rgb(107, 114, 128)`
- **Usage**: Secondary text, placeholders
- **Accessibility**: AA compliant on white

#### Light Gray
- **Hex**: `#F3F4F6`
- **RGB**: `rgb(243, 244, 246)`
- **Usage**: Backgrounds, borders, dividers

#### Pure White
- **Hex**: `#FFFFFF`
- **RGB**: `rgb(255, 255, 255)`
- **Usage**: Backgrounds, cards, text on dark backgrounds

## Typography

### Font Families

#### Primary Font: Inter
```css
font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
```
- **Usage**: All UI text, body copy, navigation
- **Weights**: 400 (Regular), 500 (Medium), 600 (Semi-Bold), 700 (Bold)
- **Source**: Google Fonts
- **Load**: 400, 500, 600, 700 weights

#### Secondary Font: Roboto Mono (Optional)
```css
font-family: 'Roboto Mono', 'Courier New', monospace;
```
- **Usage**: Code snippets, technical data, sensor IDs
- **Weights**: 400, 500
- **Source**: Google Fonts

### Type Scale

#### Headings
```css
h1 {
  font-size: 3.5rem;      /* 56px */
  line-height: 1.1;
  font-weight: 700;
  letter-spacing: -0.02em;
}

h2 {
  font-size: 2.5rem;      /* 40px */
  line-height: 1.2;
  font-weight: 700;
  letter-spacing: -0.01em;
}

h3 {
  font-size: 1.875rem;    /* 30px */
  line-height: 1.3;
  font-weight: 600;
}

h4 {
  font-size: 1.5rem;      /* 24px */
  line-height: 1.4;
  font-weight: 600;
}

h5 {
  font-size: 1.25rem;     /* 20px */
  line-height: 1.5;
  font-weight: 600;
}

h6 {
  font-size: 1rem;        /* 16px */
  line-height: 1.5;
  font-weight: 600;
}
```

#### Body Text
```css
body {
  font-size: 1rem;        /* 16px */
  line-height: 1.6;
  font-weight: 400;
}

.lead-text {
  font-size: 1.25rem;     /* 20px */
  line-height: 1.6;
  font-weight: 400;
}

.small-text {
  font-size: 0.875rem;    /* 14px */
  line-height: 1.5;
}

.caption {
  font-size: 0.75rem;     /* 12px */
  line-height: 1.4;
}
```

### Responsive Typography

#### Mobile (< 768px)
```css
h1 { font-size: 2.25rem; }  /* 36px */
h2 { font-size: 1.875rem; } /* 30px */
h3 { font-size: 1.5rem; }   /* 24px */
```

#### Tablet (768px - 1024px)
```css
h1 { font-size: 3rem; }     /* 48px */
h2 { font-size: 2.25rem; }  /* 36px */
h3 { font-size: 1.75rem; }  /* 28px */
```

## Spacing System

### Scale (8px base)
```css
--space-xs: 0.25rem;    /* 4px */
--space-sm: 0.5rem;     /* 8px */
--space-md: 1rem;       /* 16px */
--space-lg: 1.5rem;     /* 24px */
--space-xl: 2rem;       /* 32px */
--space-2xl: 3rem;      /* 48px */
--space-3xl: 4rem;      /* 64px */
--space-4xl: 6rem;      /* 96px */
--space-5xl: 8rem;      /* 128px */
```

### Section Spacing
- **Section padding (vertical)**: `--space-4xl` (96px desktop), `--space-3xl` (64px mobile)
- **Section padding (horizontal)**: `--space-xl` (32px desktop), `--space-lg` (24px mobile)
- **Content max-width**: 1200px
- **Text max-width**: 700px (for readability)

## Components

### Buttons

#### Primary Button
```css
.btn-primary {
  background-color: #0066CC;
  color: #FFFFFF;
  padding: 12px 32px;
  border-radius: 8px;
  font-weight: 600;
  font-size: 1rem;
  border: none;
  cursor: pointer;
  transition: all 0.2s ease;
}

.btn-primary:hover {
  background-color: #0052A3;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 102, 204, 0.3);
}
```

#### Secondary Button
```css
.btn-secondary {
  background-color: transparent;
  color: #0066CC;
  padding: 12px 32px;
  border-radius: 8px;
  font-weight: 600;
  font-size: 1rem;
  border: 2px solid #0066CC;
  cursor: pointer;
  transition: all 0.2s ease;
}

.btn-secondary:hover {
  background-color: #0066CC;
  color: #FFFFFF;
}
```

#### Button Sizes
```css
.btn-sm { padding: 8px 20px; font-size: 0.875rem; }
.btn-md { padding: 12px 32px; font-size: 1rem; }
.btn-lg { padding: 16px 40px; font-size: 1.125rem; }
```

### Cards

```css
.card {
  background: #FFFFFF;
  border-radius: 12px;
  padding: 2rem;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}

.card:hover {
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
  transform: translateY(-4px);
}

.card-header {
  font-size: 1.5rem;
  font-weight: 600;
  margin-bottom: 1rem;
  color: #1A1A1A;
}

.card-body {
  color: #6B7280;
  line-height: 1.6;
}
```

### Forms

```css
.form-input {
  width: 100%;
  padding: 12px 16px;
  border: 2px solid #E5E7EB;
  border-radius: 8px;
  font-size: 1rem;
  font-family: inherit;
  transition: all 0.2s ease;
}

.form-input:focus {
  outline: none;
  border-color: #0066CC;
  box-shadow: 0 0 0 3px rgba(0, 102, 204, 0.1);
}

.form-label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: 500;
  color: #1A1A1A;
}

.form-error {
  color: #FF3B30;
  font-size: 0.875rem;
  margin-top: 0.25rem;
}
```

### Badges & Tags

```css
.badge {
  display: inline-block;
  padding: 4px 12px;
  border-radius: 12px;
  font-size: 0.875rem;
  font-weight: 500;
}

.badge-success {
  background-color: #D1FAE5;
  color: #065F46;
}

.badge-warning {
  background-color: #FEF3C7;
  color: #92400E;
}

.badge-danger {
  background-color: #FEE2E2;
  color: #991B1B;
}

.badge-info {
  background-color: #DBEAFE;
  color: #1E40AF;
}
```

### Navigation

```css
.nav-link {
  color: #1A1A1A;
  font-weight: 500;
  padding: 8px 16px;
  text-decoration: none;
  transition: color 0.2s ease;
}

.nav-link:hover {
  color: #0066CC;
}

.nav-link-active {
  color: #0066CC;
  font-weight: 600;
}
```

## Icons

### Icon Library
Use **Feather Icons** or **Lucide Icons** for consistency
- Outline style preferred
- Stroke width: 2px
- Size: 20px, 24px, 32px (based on context)

### Icon Usage
- Use icons to support text, not replace it
- Ensure proper alt text for accessibility
- Maintain consistent sizing within sections
- Use primary color for active/interactive icons

## Grid & Layout

### Container
```css
.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
}

@media (min-width: 1024px) {
  .container {
    padding: 0 32px;
  }
}
```

### Grid System (12-column)
```css
.grid {
  display: grid;
  gap: 24px;
}

.grid-cols-2 { grid-template-columns: repeat(2, 1fr); }
.grid-cols-3 { grid-template-columns: repeat(3, 1fr); }
.grid-cols-4 { grid-template-columns: repeat(4, 1fr); }

@media (max-width: 768px) {
  .grid-cols-2,
  .grid-cols-3,
  .grid-cols-4 {
    grid-template-columns: 1fr;
  }
}
```

## Shadows

```css
--shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);
--shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
--shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1);
--shadow-xl: 0 20px 25px rgba(0, 0, 0, 0.15);
```

## Border Radius

```css
--radius-sm: 4px;
--radius-md: 8px;
--radius-lg: 12px;
--radius-xl: 16px;
--radius-full: 9999px;
```

## Animation & Transitions

### Timing Functions
```css
--ease-in: cubic-bezier(0.4, 0, 1, 1);
--ease-out: cubic-bezier(0, 0, 0.2, 1);
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);
```

### Standard Transitions
```css
transition: all 0.2s ease-in-out;  /* Fast interactions */
transition: all 0.3s ease-in-out;  /* Medium interactions */
transition: all 0.5s ease-in-out;  /* Slow, emphasis */
```

### Hover Effects
- **Buttons**: Slight lift (translateY -2px) + shadow
- **Cards**: Lift + enhanced shadow
- **Links**: Color change
- **Images**: Slight zoom (scale 1.05)

## Accessibility Guidelines

### Color Contrast
- Text must meet WCAG 2.1 AA standards (4.5:1)
- Large text (18pt+) must meet 3:1
- Interactive elements must meet 3:1

### Focus States
```css
*:focus {
  outline: 2px solid #0066CC;
  outline-offset: 2px;
}
```

### Touch Targets
- Minimum size: 44x44px (Apple), 48x48px (Android)
- Adequate spacing between clickable elements

### Semantic HTML
- Use proper heading hierarchy (H1 → H6)
- Use `<button>` for actions, `<a>` for navigation
- Use `<nav>`, `<main>`, `<footer>`, etc.

## Image Guidelines

### Hero Images
- Dimensions: 1920x1080px (16:9)
- Format: WebP with JPG fallback
- Max file size: 200KB

### Product Screenshots
- Dimensions: 1200x800px
- Format: PNG or WebP
- Show real UI, not mockups
- Add subtle drop shadow

### Icons & Illustrations
- Format: SVG (preferred) or PNG
- Use brand colors
- Simple, clean style
- Optimized file size

### Logo Usage
- Minimum size: 120px width
- Clear space: Equal to logo height
- Don't distort or recolor
- Always on solid background (white or dark)

## Breakpoints

```css
/* Mobile First */
--mobile: 0px;
--tablet: 768px;
--desktop: 1024px;
--wide: 1280px;
--ultra-wide: 1536px;
```

## Voice & Tone

### Writing Style
- **Clear**: Use simple language, avoid jargon
- **Concise**: Get to the point quickly
- **Confident**: Assert value, don't hedge
- **Friendly**: Approachable but professional
- **Action-oriented**: Use active voice

### Example Phrases
✅ **Good**: "Monitor your temperature 24/7 with instant alerts"
❌ **Bad**: "Our system can help you potentially monitor temperatures"

✅ **Good**: "Get started in 5 minutes"
❌ **Bad**: "Implementation may take some time"

✅ **Good**: "Protect your assets with intelligent monitoring"
❌ **Bad**: "You might want to consider using monitoring"

## Implementation Checklist

### For Developers
- [ ] Load Inter font from Google Fonts
- [ ] Implement CSS variables for colors, spacing, shadows
- [ ] Create reusable component classes
- [ ] Ensure responsive design at all breakpoints
- [ ] Test color contrast with accessibility tools
- [ ] Implement focus states for keyboard navigation
- [ ] Optimize images (WebP + fallback)
- [ ] Use semantic HTML throughout

### For Designers
- [ ] Follow color palette strictly
- [ ] Use proper type scale
- [ ] Maintain consistent spacing
- [ ] Design for mobile first
- [ ] Include focus and hover states
- [ ] Ensure 4.5:1 contrast ratio minimum
- [ ] Use brand icons consistently
- [ ] Provide multiple breakpoint designs
