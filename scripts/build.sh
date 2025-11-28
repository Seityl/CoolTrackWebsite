#!/bin/bash

# Cool Track - Hugo Build Script
# Builds the static site for production serving with Caddy

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
HUGO_BIN="/usr/local/bin/hugo"
LOG_FILE="$PROJECT_DIR/build.log"

# Add Go to PATH
export PATH=$PATH:/usr/local/go/bin

# Change to project directory
cd "$PROJECT_DIR"

# Log build start
echo "$(date '+%Y-%m-%d %H:%M:%S') - Starting Hugo build..." >> "$LOG_FILE"

# Build the site with minification
if $HUGO_BIN --minify >> "$LOG_FILE" 2>&1; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Build completed successfully" >> "$LOG_FILE"
    
    # Restart Caddy to pick up changes (since admin API is disabled)
    if systemctl is-active --quiet cooltrack-caddy; then
        sudo systemctl restart cooltrack-caddy
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Caddy restarted" >> "$LOG_FILE"
    fi
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Build failed" >> "$LOG_FILE"
    exit 1
fi
