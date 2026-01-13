#!/bin/bash

# Script to show available updates and let user choose what to install
# This allows vetting updates before installation

echo "🔍 Checking for available updates..."
echo "======================================="

# Check for pacman updates
echo ""
echo "📦 Pacman Updates:"
echo "-------------------"
if command -v checkupdates >/dev/null 2>&1; then
    pacman_updates=$(checkupdates 2>/dev/null)
    if [[ -n "$pacman_updates" ]]; then
        echo "$pacman_updates"
        pacman_count=$(echo "$pacman_updates" | wc -l)
        echo ""
        echo "Found $pacman_count pacman updates"
    else
        echo "✅ No pacman updates available"
    fi
else
    echo "⚠️  checkupdates not available"
fi

# Check for AUR updates
echo ""
echo "🏗️  AUR Updates:"
echo "----------------"
if command -v yay >/dev/null 2>&1; then
    aur_updates=$(yay -Qu 2>/dev/null)
    if [[ -n "$aur_updates" ]]; then
        echo "$aur_updates"
        aur_count=$(echo "$aur_updates" | wc -l)
        echo ""
        echo "Found $aur_count AUR updates"
    else
        echo "✅ No AUR updates available"
    fi
else
    echo "⚠️  yay not available"
fi

echo ""
echo "======================================="
echo "🛡️  Update Options:"
echo "1. Install pacman updates only (pacman -Syu)"
echo "2. Install AUR updates only (yay -Syu --aur)"
echo "3. Install all updates (yay -Syu)"
echo "4. Exit without updating"
echo ""

while true; do
    read -p "Choose an option [1-4]: " choice
    case $choice in
        1)
            echo ""
            echo "🔐 Installing pacman updates..."
            sudo pacman -Syu
            # Auto-refresh Waybar update module after installation
            echo "🔄 Refreshing update status..."
            rm -f /tmp/waybar_updates_cache 2>/dev/null
            rm -f ~/.cache/waybar-updates-* 2>/dev/null || true
            break
            ;;
        2)
            echo ""
            echo "🔐 Installing AUR updates..."
            yay -Syu --aur
            # Auto-refresh Waybar update module after installation
            echo "🔄 Refreshing update status..."
            rm -f /tmp/waybar_updates_cache 2>/dev/null
            rm -f ~/.cache/waybar-updates-* 2>/dev/null || true
            break
            ;;
        3)
            echo ""
            echo "🔐 Installing all updates..."
            yay -Syu
            # Auto-refresh Waybar update module after installation
            echo "🔄 Refreshing update status..."
            rm -f /tmp/waybar_updates_cache 2>/dev/null
            rm -f ~/.cache/waybar-updates-* 2>/dev/null || true
            break
            ;;
        4)
            echo "👋 Exiting without updating"
            break
            ;;
        *)
            echo "❌ Invalid option. Please choose 1-4."
            ;;
    esac
done

echo ""
echo "Press any key to close..."
read -n 1 -s