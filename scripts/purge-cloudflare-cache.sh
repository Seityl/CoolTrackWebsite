#!/bin/bash

# Cloudflare Cache Purge Script for cooltrack.co
# This script purges the Cloudflare cache using the API

echo "=== Cloudflare Cache Purge Tool ==="
echo ""

# Check if API credentials are provided
if [ -z "$CF_ZONE_ID" ] || [ -z "$CF_API_TOKEN" ]; then
    echo "❌ Missing Cloudflare credentials!"
    echo ""
    echo "Please set the following environment variables:"
    echo "  export CF_ZONE_ID='your_zone_id'"
    echo "  export CF_API_TOKEN='your_api_token'"
    echo ""
    echo "To get these credentials:"
    echo "  1. Login to https://dash.cloudflare.com/"
    echo "  2. Select domain: cooltrack.co"
    echo "  3. Zone ID is on the right sidebar (Overview page)"
    echo "  4. API Token: My Profile → API Tokens → Create Token"
    echo "     - Use 'Edit zone DNS' template"
    echo "     - Or create custom token with 'Cache Purge' permission"
    echo ""
    echo "Alternatively, purge manually:"
    echo "  1. Go to: https://dash.cloudflare.com/"
    echo "  2. Select: cooltrack.co"
    echo "  3. Caching → Configuration"
    echo "  4. Click: 'Purge Everything'"
    echo ""
    exit 1
fi

echo "Zone ID: ${CF_ZONE_ID:0:10}..."
echo "Purging cache for: cooltrack.co"
echo ""

# Purge all cache
RESPONSE=$(curl -s -X POST "https://api.cloudflare.com/client/v4/zones/$CF_ZONE_ID/purge_cache" \
     -H "Authorization: Bearer $CF_API_TOKEN" \
     -H "Content-Type: application/json" \
     --data '{"purge_everything":true}')

# Check response
if echo "$RESPONSE" | grep -q '"success":true'; then
    echo "✅ Cache purge successful!"
    echo ""
    echo "Wait 30-60 seconds for global propagation, then test:"
    echo "  curl -I https://cooltrack.co/plugins/webfont-loader/webfont-loader-2.min.js | grep content-type"
    echo ""
    echo "Expected: content-type: text/javascript"
else
    echo "❌ Cache purge failed!"
    echo ""
    echo "Response:"
    echo "$RESPONSE" | jq . 2>/dev/null || echo "$RESPONSE"
    echo ""
    exit 1
fi
