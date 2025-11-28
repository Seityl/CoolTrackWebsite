#!/bin/bash

echo "=== Cloudflare Tunnel Diagnostic ==="
echo ""
echo "✓ Checking Caddy status..."
if systemctl is-active --quiet cooltrack-caddy; then
    echo "  ✅ Caddy is running"
    if curl -s -o /dev/null -w "%{http_code}" http://localhost:80/ | grep -q 200; then
        echo "  ✅ Caddy responding on port 80"
    else
        echo "  ❌ Caddy not responding on port 80"
    fi
else
    echo "  ❌ Caddy is NOT running"
fi

echo ""
echo "✓ Checking Cloudflare Tunnel status..."
if systemctl is-active --quiet cloudflared; then
    echo "  ✅ Tunnel is running"
else
    echo "  ❌ Tunnel is NOT running"
fi

echo ""
echo "✓ Checking tunnel logs for errors..."
ERROR_COUNT=$(sudo journalctl -u cloudflared --since "1 minute ago" --no-pager | grep -c "ERR.*connection refused" || echo 0)
if [ "$ERROR_COUNT" -gt 0 ]; then
    echo "  ⚠️  Found $ERROR_COUNT connection errors in the last minute"
    echo "  📝 Recent error:"
    sudo journalctl -u cloudflared --since "1 minute ago" --no-pager | grep "originService" | tail -1
    echo ""
    echo "  💡 The tunnel should be connecting to: http://localhost:80"
    echo "  💡 Update this in Cloudflare Dashboard → Tunnels → Configure → Public Hostname"
else
    echo "  ✅ No connection errors in the last minute"
fi

echo ""
echo "✓ Testing external access..."
echo "  Visit: https://cooltrack.co"
echo ""
