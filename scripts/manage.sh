#!/bin/bash

# Cool Track Website Management Script
# Simple interface for common operations

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WEBSITE_DIR="$(dirname "$SCRIPT_DIR")"

# Color codes for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

show_menu() {
    clear
    echo -e "${BLUE}╔════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║   Cool Track Website Management           ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${GREEN}1)${NC} Build website (rebuild static files)"
    echo -e "${GREEN}2)${NC} Enable maintenance mode"
    echo -e "${GREEN}3)${NC} Disable maintenance mode"
    echo -e "${GREEN}4)${NC} Check status"
    echo -e "${GREEN}5)${NC} Diagnose Cloudflare Tunnel"
    echo -e "${GREEN}6)${NC} View Caddy logs"
    echo -e "${GREEN}7)${NC} View Tunnel logs"
    echo ""
    echo -e "${RED}0)${NC} Exit"
    echo ""
    echo -n "Select option: "
}

while true; do
    show_menu
    read -r option
    
    case $option in
        1)
            clear
            echo -e "${BLUE}Building website...${NC}"
            "$SCRIPT_DIR/build.sh"
            echo ""
            read -p "Press Enter to continue..."
            ;;
        2)
            clear
            "$SCRIPT_DIR/maintenance-enable.sh"
            echo ""
            read -p "Press Enter to continue..."
            ;;
        3)
            clear
            "$SCRIPT_DIR/maintenance-disable.sh"
            echo ""
            read -p "Press Enter to continue..."
            ;;
        4)
            clear
            "$SCRIPT_DIR/status.sh"
            echo ""
            read -p "Press Enter to continue..."
            ;;
        5)
            clear
            "$SCRIPT_DIR/diagnose-tunnel.sh"
            echo ""
            read -p "Press Enter to continue..."
            ;;
        6)
            clear
            echo -e "${BLUE}Caddy logs (Ctrl+C to exit):${NC}"
            echo ""
            sudo journalctl -u cooltrack-caddy -f
            ;;
        7)
            clear
            echo -e "${BLUE}Cloudflare Tunnel logs (Ctrl+C to exit):${NC}"
            echo ""
            sudo journalctl -u cloudflared -f
            ;;
        0)
            clear
            echo -e "${GREEN}Goodbye!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option. Press Enter to try again...${NC}"
            read -p ""
            ;;
    esac
done
