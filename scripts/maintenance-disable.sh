#!/bin/bash

# Cool Track - Disable Maintenance Mode
# This script switches the website back to production mode

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WEBSITE_DIR="$(dirname "$SCRIPT_DIR")"
CADDYFILE="$WEBSITE_DIR/Caddyfile"
BACKUP_CADDYFILE="$WEBSITE_DIR/Caddyfile.production"

echo "🚀 Disabling Maintenance Mode for Cool Track..."
echo ""

# Check if production backup exists
if [ ! -f "$BACKUP_CADDYFILE" ]; then
    echo "❌ Error: Production Caddyfile backup not found at $BACKUP_CADDYFILE"
    echo "💡 You may need to manually restore your Caddyfile"
    exit 1
fi

# Restore production Caddyfile
echo "🔄 Restoring production Caddyfile..."
cp "$BACKUP_CADDYFILE" "$CADDYFILE"

# Restart Caddy (using restart since admin API is disabled)
echo "♻️  Restarting Caddy..."
if sudo systemctl restart cooltrack-caddy; then
    echo ""
    echo "✅ Maintenance mode disabled successfully!"
    echo ""
    echo "🌐 Your website is now live and serving production content"
    echo "🧹 You can remove the backup with: rm $BACKUP_CADDYFILE"
    echo ""
else
    echo ""
    echo "❌ Failed to reload Caddy"
    echo "💡 Check the logs: sudo journalctl -u cooltrack-caddy -n 50"
    exit 1
fi
