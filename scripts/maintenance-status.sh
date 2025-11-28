#!/bin/bash

# Cool Track - Check Maintenance Mode Status

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WEBSITE_DIR="$(dirname "$SCRIPT_DIR")"
CADDYFILE="$WEBSITE_DIR/Caddyfile"
BACKUP_CADDYFILE="$WEBSITE_DIR/Caddyfile.production"

echo "=== Cool Track Maintenance Mode Status ==="
echo ""

# Check if maintenance mode is active
if grep -q "maintenance.html" "$CADDYFILE" 2>/dev/null; then
    echo "🔧 Status: MAINTENANCE MODE ACTIVE"
    echo ""
    echo "The website is currently showing the maintenance page."
    echo ""
    if [ -f "$BACKUP_CADDYFILE" ]; then
        echo "✅ Production backup available"
    else
        echo "⚠️  No production backup found"
    fi
    echo ""
    echo "To disable maintenance mode: ./scripts/maintenance-disable.sh"
else
    echo "✅ Status: PRODUCTION MODE ACTIVE"
    echo ""
    echo "The website is currently serving normal content."
    echo ""
    echo "To enable maintenance mode: ./scripts/maintenance-enable.sh"
fi

echo ""
echo "=== Caddy Service Status ==="
systemctl status cooltrack-caddy --no-pager | grep "Active:"
echo ""
