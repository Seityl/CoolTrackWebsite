#!/bin/bash

# Cool Track - Enable Maintenance Mode
# This script switches the website to maintenance mode

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WEBSITE_DIR="$(dirname "$SCRIPT_DIR")"
CADDYFILE="$WEBSITE_DIR/Caddyfile"
MAINTENANCE_CADDYFILE="$WEBSITE_DIR/Caddyfile.maintenance"
BACKUP_CADDYFILE="$WEBSITE_DIR/Caddyfile.production"

echo "🔧 Enabling Maintenance Mode for Cool Track..."
echo ""

# Check if maintenance Caddyfile exists
if [ ! -f "$MAINTENANCE_CADDYFILE" ]; then
    echo "❌ Error: Maintenance Caddyfile not found at $MAINTENANCE_CADDYFILE"
    exit 1
fi

# Backup current production Caddyfile
if [ -f "$CADDYFILE" ]; then
    echo "📦 Backing up current Caddyfile to Caddyfile.production..."
    cp "$CADDYFILE" "$BACKUP_CADDYFILE"
fi

# Switch to maintenance Caddyfile
echo "🔄 Switching to maintenance mode..."
cp "$MAINTENANCE_CADDYFILE" "$CADDYFILE"

# Restart Caddy (using restart since admin API is disabled)
echo "♻️  Restarting Caddy..."
if sudo systemctl restart cooltrack-caddy; then
    echo ""
    echo "✅ Maintenance mode enabled successfully!"
    echo ""
    echo "🌐 Your website now shows the maintenance page"
    echo "📝 To disable: ./scripts/maintenance-disable.sh or run ./manage"
    echo ""
else
    echo ""
    echo "❌ Failed to reload Caddy"
    echo "💡 Restoring production Caddyfile..."
    cp "$BACKUP_CADDYFILE" "$CADDYFILE"
    sudo systemctl restart cooltrack-caddy
    exit 1
fi
