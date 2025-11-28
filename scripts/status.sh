#!/bin/bash

# Cool Track - Quick Reference Commands
# Common operations for managing your website

echo "=== Cool Track Website Management ==="
echo ""

# Check status
echo "📊 SERVICE STATUS:"
echo "Caddy Web Server:"
sudo systemctl status cooltrack-caddy --no-pager | grep "Active:"
echo ""
echo "Cloudflare Tunnel:"
sudo systemctl status cloudflared --no-pager | grep "Active:" 2>/dev/null || echo "  Not configured yet"
echo ""

# Check ports
echo "🔌 LISTENING PORTS:"
echo "Port 8080 (Caddy):"
ss -tlnp 2>/dev/null | grep :8080 || echo "  Not listening"
echo ""

# Last build
echo "🔨 LAST BUILD:"
if [ -f build.log ]; then
    tail -n 2 build.log
else
    echo "  No builds yet"
fi
echo ""

# Website test
echo "🌐 WEBSITE TEST:"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/)
if [ "$HTTP_CODE" = "200" ]; then
    echo "  ✅ Website responding (HTTP $HTTP_CODE)"
else
    echo "  ❌ Website not responding (HTTP $HTTP_CODE)"
fi
echo ""

# Disk usage
echo "💾 DISK USAGE:"
du -sh /home/hugo/cooltrack-website/public 2>/dev/null || echo "  Site not built"
echo ""

echo "=== QUICK COMMANDS ==="
echo ""
echo "Rebuild website:        ./scripts/build.sh"
echo "Restart Caddy:          sudo systemctl restart cooltrack-caddy"
echo "View Caddy logs:        sudo journalctl -u cooltrack-caddy -f"
echo "View tunnel logs:       sudo journalctl -u cloudflared -f"
echo "Test website locally:   curl -I http://localhost:8080"
echo ""
