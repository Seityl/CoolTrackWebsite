#!/bin/bash

# GitHub Project Setup Script
# This script creates labels, milestones, and issues for the Cool Track project

REPO_OWNER="Seityl"
REPO_NAME="CoolTrackWebsite"
API_URL="https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}"

# Check if GITHUB_TOKEN is set
if [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: GITHUB_TOKEN environment variable is not set"
    exit 1
fi

echo "🚀 Setting up Cool Track GitHub Project..."
echo ""

# Function to make GitHub API calls
github_api() {
    curl -s -H "Authorization: token ${GITHUB_TOKEN}" \
         -H "Accept: application/vnd.github.v3+json" \
         "$@"
}

# Create Labels
echo "📋 Creating labels..."

labels=(
    "phase-1:0066CC:Phase 1 - Foundation"
    "phase-2:0066CC:Phase 2 - Core Pages"
    "phase-3:0066CC:Phase 3 - Content & SEO"
    "phase-4:0066CC:Phase 4 - Interactive Features"
    "phase-5:0066CC:Phase 5 - Quality Assurance"
    "phase-6:0066CC:Phase 6 - Launch Prep"
    "phase-7:0066CC:Phase 7 - Launch"
    "feature:00D97E:New feature or enhancement"
    "content:FF9500:Content creation or updates"
    "design:00C9FF:Design and UI/UX work"
    "testing:6B7280:Testing and QA"
    "infrastructure:003D7A:Infrastructure and DevOps"
    "seo:00D97E:SEO related"
    "performance:00D97E:Performance optimization"
    "accessibility:00D97E:Accessibility improvements"
    "priority-critical:FF3B30:Critical priority"
    "priority-high:FF9500:High priority"
    "priority-medium:00C9FF:Medium priority"
    "priority-low:6B7280:Low priority"
    "needs-review:FF9500:Needs review"
    "in-progress:00C9FF:Currently in progress"
    "blocked:FF3B30:Blocked by dependencies"
)

for label in "${labels[@]}"; do
    IFS=':' read -r name color description <<< "$label"
    github_api -X POST "${API_URL}/labels" \
        -d "{\"name\":\"${name}\",\"color\":\"${color}\",\"description\":\"${description}\"}" \
        > /dev/null 2>&1
    echo "  ✓ Created label: ${name}"
done

echo ""

# Create Milestones
echo "🎯 Creating milestones..."

milestones=(
    "Phase 1: Foundation & Setup:Week 1 - Establish project infrastructure:2025-12-03"
    "Phase 2: Core Pages Development:Week 2-3 - Build essential pages:2025-12-17"
    "Phase 3: Content & SEO:Week 4 - Populate with optimized content:2025-12-24"
    "Phase 4: Interactive Features:Week 5 - Add forms and interactions:2026-01-02"
    "Phase 5: Quality Assurance:Week 6 - Testing and optimization:2026-01-09"
    "Phase 6: Launch Preparation:Week 7 - Final preparations:2026-01-14"
    "Phase 7: Launch:Week 8 - Go live and monitor:2026-01-21"
)

for milestone in "${milestones[@]}"; do
    IFS=':' read -r title description due_date <<< "$milestone"
    github_api -X POST "${API_URL}/milestones" \
        -d "{\"title\":\"${title}\",\"description\":\"${description}\",\"due_on\":\"${due_date}T23:59:59Z\"}" \
        > /dev/null 2>&1
    echo "  ✓ Created milestone: ${title}"
done

echo ""
echo "✅ GitHub project setup complete!"
echo ""
echo "Next steps:"
echo "1. Run the create-issues script to populate issues"
echo "2. Set up GitHub Project board"
echo "3. Begin Phase 1 development"
