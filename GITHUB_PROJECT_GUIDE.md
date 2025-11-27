# GitHub Project Management Guide

## Overview

This document outlines how we'll use GitHub for project management, issue tracking, and progress monitoring for the Cool Track landing page project.

---

## GitHub Projects Setup

### Project Board Structure

**Project Name:** Cool Track Landing Page  
**View Type:** Board (Kanban style)

**Columns:**
1. **Backlog** - Future work, not yet prioritized
2. **Ready** - Approved and ready to start
3. **In Progress** - Currently being worked on
4. **Review** - In code review or QA
5. **Done** - Completed and merged

### Project Fields

| Field Name | Type | Options/Values |
|------------|------|----------------|
| Status | Single select | Backlog, Ready, In Progress, Review, Done |
| Priority | Single select | Critical, High, Medium, Low |
| Team | Single select | Design, Development, Content, QA |
| Estimate | Number | Story points (1, 2, 3, 5, 8, 13) |
| Sprint | Single select | Sprint 1, Sprint 2, etc. |
| Type | Single select | Feature, Bug, Documentation, Enhancement |

---

## Issue Labels

### Type Labels
- `type: feature` - New feature implementation (🟦 Blue)
- `type: bug` - Bug fix (🟥 Red)
- `type: documentation` - Documentation updates (📘 Blue)
- `type: enhancement` - Improvement to existing feature (🟨 Yellow)
- `type: refactor` - Code refactoring (🟪 Purple)

### Priority Labels
- `priority: critical` - Must be done immediately (🔴 Red)
- `priority: high` - Important, should be done soon (🟠 Orange)
- `priority: medium` - Normal priority (🟡 Yellow)
- `priority: low` - Nice to have (🟢 Green)

### Status Labels
- `status: blocked` - Waiting on dependencies (⛔ Red)
- `status: in-progress` - Currently being worked on (🔵 Blue)
- `status: review` - Ready for review (🟣 Purple)
- `status: needs-info` - Requires more information (❓ Gray)

### Team Labels
- `team: design` - Design team responsibility (🎨 Pink)
- `team: development` - Development team responsibility (💻 Green)
- `team: content` - Content team responsibility (✍️ Blue)
- `team: qa` - QA team responsibility (🧪 Orange)

### Size Labels
- `size: xs` - Extra small (1-2 hours)
- `size: s` - Small (2-4 hours)
- `size: m` - Medium (4-8 hours)
- `size: l` - Large (1-2 days)
- `size: xl` - Extra large (2-5 days)

### Component Labels
- `component: navigation`
- `component: hero`
- `component: features`
- `component: pricing`
- `component: forms`
- `component: footer`
- `component: seo`

---

## Issue Templates

### Feature Request Template

See `.github/ISSUE_TEMPLATE/feature_request.md`

### Bug Report Template

See `.github/ISSUE_TEMPLATE/bug_report.md`

### Content Request Template

See `.github/ISSUE_TEMPLATE/content_request.md`

### Design Task Template

See `.github/ISSUE_TEMPLATE/design_task.md`

---

## Milestones

### Milestone 1: Project Setup (Week 1)
**Due Date:** [Date]  
**Goals:**
- Hugo setup complete
- Theme installed and configured
- Project structure established
- Development environment ready

**Issues:**
- #1 Setup Hugo project
- #2 Install Andromeda Light theme
- #3 Configure Hugo settings
- #4 Create initial file structure

### Milestone 2: Design Phase (Week 2-3)
**Due Date:** [Date]  
**Goals:**
- All page designs completed
- Design system documented
- Assets prepared

**Issues:**
- #5 Create design system
- #6 Design homepage
- #7 Design features page
- #8 Design pricing page
- #9 Design industry pages
- #10 Create icon set
- #11 Prepare image assets

### Milestone 3: Development - Core Pages (Week 4-5)
**Due Date:** [Date]  
**Goals:**
- Homepage fully functional
- Features page complete
- Pricing page complete
- Navigation and footer complete

**Issues:**
- #12 Implement navigation component
- #13 Build homepage hero section
- #14 Build features section
- #15 Build pricing component
- #16 Build footer component
- #17 Implement contact form

### Milestone 4: Development - Industry Pages (Week 5-6)
**Due Date:** [Date]  
**Goals:**
- All 5 industry pages complete
- Industry page template reusable

**Issues:**
- #18 Create industry page template
- #19 Build healthcare page
- #20 Build food & beverage page
- #21 Build data centers page
- #22 Build warehousing page
- #23 Build manufacturing page

### Milestone 5: Content & SEO (Week 6)
**Due Date:** [Date]  
**Goals:**
- All copy finalized
- SEO optimization complete
- Metadata implemented

**Issues:**
- #24 Write homepage copy
- #25 Write features copy
- #26 Write pricing copy
- #27 Write industry page copy
- #28 Implement meta tags
- #29 Add structured data
- #30 Generate sitemap

### Milestone 6: Testing & QA (Week 7)
**Due Date:** [Date]  
**Goals:**
- All tests passing
- No critical bugs
- Performance targets met

**Issues:**
- #31 Cross-browser testing
- #32 Mobile responsiveness testing
- #33 Accessibility audit
- #34 Performance optimization
- #35 SEO audit
- #36 Form testing

### Milestone 7: Launch (Week 8)
**Due Date:** [Date]  
**Goals:**
- Site deployed
- Analytics configured
- Monitoring in place

**Issues:**
- #37 Deploy to production
- #38 Configure analytics
- #39 Setup monitoring
- #40 Submit sitemap to search engines

---

## Sprint Planning

### Sprint Duration
2 weeks per sprint

### Sprint Ceremonies

**Sprint Planning (Start of Sprint)**
- Duration: 2 hours
- Review backlog
- Assign issues to sprint
- Set sprint goals
- Estimate effort

**Daily Standups (Asynchronous via GitHub)**
- Post daily update on assigned issues
- What was completed
- What's in progress
- Any blockers

**Sprint Review (End of Sprint)**
- Duration: 1 hour
- Demo completed work
- Review metrics
- Gather feedback

**Sprint Retrospective (End of Sprint)**
- Duration: 1 hour
- What went well
- What to improve
- Action items

---

## Workflow Process

### 1. Issue Creation
```
1. Create issue from template
2. Add description and acceptance criteria
3. Add labels (type, priority, team, component)
4. Add to project board (Backlog column)
5. Link to milestone if applicable
```

### 2. Issue Refinement
```
1. Product manager reviews backlog weekly
2. Add size estimates
3. Move to "Ready" when:
   - Requirements clear
   - Dependencies resolved
   - Priority set
```

### 3. Starting Work
```
1. AI agent assigns issue to self
2. Move to "In Progress" column
3. Update status label
4. Create branch: type/GH-XX-description
5. Post comment: "Starting work on this"
```

### 4. During Development
```
1. Commit frequently with descriptive messages
2. Reference issue in commits: "feat(nav): add mobile menu #12"
3. Post progress updates daily
4. Ask questions in issue comments
5. Update if blocked
```

### 5. Ready for Review
```
1. Push all changes
2. Create pull request
3. Link PR to issue (use "Closes #XX")
4. Move issue to "Review" column
5. Request review from assigned reviewer
```

### 6. Code Review
```
1. Reviewer checks against acceptance criteria
2. Runs tests locally
3. Provides feedback
4. Approves or requests changes
```

### 7. Merge & Close
```
1. Merge PR (squash and merge)
2. Delete branch
3. Issue auto-moves to "Done"
4. Verify deployment
```

---

## Example Issues

### Example 1: Feature Implementation

**Title:** Build Homepage Hero Section

**Labels:** `type: feature`, `priority: high`, `team: development`, `component: hero`, `size: m`

**Milestone:** Development - Core Pages

**Description:**
```markdown
## Overview
Implement the homepage hero section according to design specifications.

## Requirements
- Responsive hero section (mobile, tablet, desktop)
- Background image with WebP optimization
- Hero headline and subheadline
- Two CTA buttons (primary and secondary)
- Product demo visual/screenshot

## Acceptance Criteria
- [ ] Hero displays correctly on all breakpoints
- [ ] Background image loads quickly (<1s)
- [ ] CTAs are clickable and track analytics events
- [ ] Text is readable over background
- [ ] Lighthouse performance score >90
- [ ] Accessibility: proper heading hierarchy
- [ ] Code follows style guidelines

## Design
[Link to Figma/design file]

## Technical Notes
- Use Hugo partial: `layouts/partials/hero.html`
- CSS in `assets/css/components/hero.css`
- Follow BEM naming convention
- Implement lazy loading for demo image

## Dependencies
- #5 Design system completed
- #6 Homepage design finalized

## Estimated Time
6-8 hours
```

### Example 2: Content Request

**Title:** Write Healthcare Industry Page Copy

**Labels:** `type: feature`, `priority: medium`, `team: content`, `component: content`, `size: l`

**Milestone:** Content & SEO

**Description:**
```markdown
## Overview
Write comprehensive copy for the Healthcare industry page.

## Requirements
Follow CONTENT_STRATEGY.md guidelines:
- 1,500-2,000 words
- Target keyword: "hospital temperature monitoring"
- Secondary keywords: medical, pharmacy, vaccine, compliance
- Include 4 use cases
- Add 8-10 FAQs

## Content Structure
1. Hero headline and subheadline
2. Challenge section (industry pain points)
3. Solution section (how Cool Track helps)
4. Use cases (4 detailed scenarios)
5. Compliance standards
6. Customer success story
7. FAQs
8. CTA section

## SEO Requirements
- [ ] Primary keyword in H1
- [ ] Meta description (150-160 chars)
- [ ] Keywords naturally distributed
- [ ] Internal links to features and pricing
- [ ] Alt text for all images

## Deliverables
- Markdown file: `content/industries/healthcare.md`
- Front matter with metadata
- Image requirements list
- SEO checklist completed

## References
- CONTENT_STRATEGY.md
- Competitor healthcare pages
- Healthcare compliance resources

## Estimated Time
8-12 hours
```

### Example 3: Bug Report

**Title:** Mobile Navigation Menu Not Closing on iOS

**Labels:** `type: bug`, `priority: high`, `team: development`, `component: navigation`

**Description:**
```markdown
## Bug Description
The mobile navigation menu doesn't close when clicking outside the menu on iOS Safari.

## Steps to Reproduce
1. Open site on iPhone (iOS Safari)
2. Click hamburger menu to open
3. Click outside menu area
4. Expected: Menu closes
5. Actual: Menu stays open

## Environment
- Browser: iOS Safari 17.1
- Device: iPhone 14
- Screen size: 390x844

## Expected Behavior
Menu should close when:
- Clicking outside menu
- Pressing ESC key
- Clicking a menu link

## Actual Behavior
Menu remains open, requiring hamburger click to close

## Screenshots
[Attach screenshots]

## Possible Cause
Touch event listener may not be working on iOS

## Priority Justification
Affects user experience on primary mobile platform

## Acceptance Criteria
- [ ] Menu closes on outside click (iOS)
- [ ] Menu closes on link click
- [ ] ESC key closes menu
- [ ] Works on all iOS versions 15+
- [ ] No console errors
```

---

## Progress Tracking

### Metrics to Track

**Velocity:**
- Story points completed per sprint
- Issues closed per week
- Pull requests merged per week

**Quality:**
- Bugs per sprint
- Code review cycle time
- Test coverage percentage

**Performance:**
- Lighthouse scores (track weekly)
- Page load times
- Bundle sizes

**SEO:**
- Keyword rankings (monthly)
- Organic traffic (post-launch)
- Conversion rate

### Weekly Status Report Template

```markdown
# Week [X] Status Report

**Sprint:** [Sprint number]
**Date:** [Date range]

## Completed This Week
- Issue #XX - [Title]
- Issue #XX - [Title]
- Issue #XX - [Title]

## In Progress
- Issue #XX - [Title] (60% complete)
- Issue #XX - [Title] (30% complete)

## Blocked
- Issue #XX - [Title] - [Reason]

## Metrics
- Issues closed: X
- PRs merged: X
- Bugs found: X
- Bugs fixed: X

## Next Week Goals
- Complete [Feature]
- Start [Feature]
- Deploy [Milestone]

## Risks/Concerns
- [Any risks or concerns]

## Notes
- [Any other notes]
```

---

## Communication Guidelines

### Where to Communicate

**GitHub Issues:**
- Technical questions about specific issues
- Bug reports and reproduction steps
- Feature requirements and clarifications
- Progress updates

**GitHub Discussions:**
- General questions
- Ideas and proposals
- Architectural decisions
- Best practices

**Pull Request Comments:**
- Code-specific feedback
- Implementation questions
- Review comments

**Project Board:**
- Quick status checks
- Sprint planning
- Priority adjustments

### When to Tag Others

**@mention Product Manager:**
- Clarification on requirements
- Priority questions
- Scope changes
- Blocker escalation (>4 hours)

**@mention Team Lead:**
- Technical architecture questions
- Code review requests
- Deployment issues

**@mention Reviewer:**
- When PR is ready for review
- After addressing feedback

### Response Time Expectations

| Urgency | Response Time | Example |
|---------|--------------|---------|
| Critical | 1 hour | Production down |
| High | 4 hours | Blocking issue |
| Medium | 1 day | Regular question |
| Low | 2-3 days | Enhancement idea |

---

## Tools Integration

### GitHub Actions
- Automated testing on PR
- Lighthouse CI on PR
- HTML validation
- Deploy previews
- Auto-label based on file changes

### GitHub Projects Automation
- Move to "In Progress" when PR opened
- Move to "Review" when review requested
- Move to "Done" when PR merged
- Auto-assign based on labels

---

## Best Practices

### Issue Best Practices
✅ **DO:**
- Use descriptive titles
- Include acceptance criteria
- Add appropriate labels
- Link related issues
- Update status regularly
- Close when complete

❌ **DON'T:**
- Create vague issues
- Leave issues unassigned
- Work on issues not in sprint
- Close without PR
- Reopen repeatedly

### PR Best Practices
✅ **DO:**
- Link to issue
- Complete PR template
- Add screenshots for UI changes
- Keep PRs focused and small
- Respond to feedback promptly

❌ **DON'T:**
- Create massive PRs (>500 lines)
- Mix unrelated changes
- Push untested code
- Ignore review feedback
- Force push after review

---

## Emergency Procedures

### Critical Bug Process

**If critical bug found:**
1. Create issue with `priority: critical` label
2. @mention product manager
3. Move to top of "Ready" column
4. Create hotfix branch: `hotfix/GH-XX-description`
5. Fix with minimal changes
6. Fast-track review
7. Deploy immediately

**Hotfix Approval:**
- Requires 2 approvals
- Must pass all automated tests
- Must not break existing functionality

---

**Document Version:** 1.0  
**Last Updated:** November 26, 2025  
**Owner:** Product Manager
