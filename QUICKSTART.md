# Cool Track Website - Quick Reference

## Daily Operations

### Simple Management Interface
```bash
./manage
```
Interactive menu with all common operations.

### Individual Scripts
```bash
./scripts/build.sh               # Rebuild website
./scripts/status.sh              # Check server status
./scripts/maintenance-enable.sh  # Enable maintenance mode
./scripts/maintenance-disable.sh # Disable maintenance mode
./scripts/diagnose-tunnel.sh     # Diagnose Cloudflare Tunnel
```

## Common Tasks

### Update Website Content
1. Edit markdown files in `content/english/`
2. Run `./scripts/build.sh`
3. Check https://cooltrack.co

### Maintenance Mode
```bash
# Enable (shows maintenance page to visitors)
./scripts/maintenance-enable.sh

# Do your work...
git pull
./scripts/build.sh

# Disable (back to normal)
./scripts/maintenance-disable.sh
```

### Check System Status
```bash
./scripts/status.sh
# Shows: Caddy status, Tunnel status, Website test, Disk usage
```

## Services

```bash
# Caddy Web Server
sudo systemctl status cooltrack-caddy
sudo systemctl restart cooltrack-caddy
sudo journalctl -u cooltrack-caddy -f

# Cloudflare Tunnel
sudo systemctl status cloudflared
sudo systemctl restart cloudflared
sudo journalctl -u cloudflared -f
```

## Cloudflare Tunnel

**Configuration:** https://one.dash.cloudflare.com/ → Access → Tunnels

**Settings:**
- Type: HTTP
- URL: `localhost:8080`
- Domain: `cooltrack.co`

## Troubleshooting

**502 Error?**
- Check Cloudflare Tunnel is pointing to `localhost:8080`
- Run `./scripts/diagnose-tunnel.sh`

**Website not updating?**
```bash
./scripts/build.sh
sudo systemctl restart cooltrack-caddy
```

**Stuck in maintenance mode?**
```bash
./scripts/maintenance-disable.sh
```
