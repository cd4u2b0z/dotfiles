#!/bin/bash

# App Manager - Fast Focus/Kill/Launch menu
# Optimized for speed - single hyprctl call

# Get all running windows once (faster than multiple calls)
WINDOWS=$(hyprctl clients -j 2>/dev/null | jq -r '.[].class // empty' | tr '[:upper:]' '[:lower:]')

# Fast window check against cached list
is_running() { echo "$WINDOWS" | grep -qi "^$1$"; }

# App definitions: key|name|icon|class|process|launch
APPS="brave|Brave|󰊽|brave-browser|brave|brave
librewolf|LibreWolf|󰈹|librewolf|librewolf|librewolf
firefox|Firefox|󰈹|firefox|firefox|firefox
vscode|VS Code|󰨞|code|code|code
kitty|Kitty||kitty|kitty|kitty
thunar|Thunar|󰉋|thunar|thunar|thunar
spotify|Spotify|󰓇|spotify|spotify|spotify
discord|Discord|󰙯|discord|discord|discord
steam|Steam|󰓓|steam|steam|steam
obs|OBS|󰑋|obs|obs|obs-studio
gimp|GIMP|󰏘|gimp|gimp|gimp
blender|Blender|󰂫|blender|blender|blender"

menu=""
actions=""

# Build menu - running apps first
while IFS='|' read -r key name icon class proc launch; do
    if is_running "$class"; then
        menu+="$icon  Focus $name\n"
        actions+="focus|$class|$name\n"
        menu+="󰅖  Close $name\n"
        actions+="close|$proc|$name\n"
    fi
done <<< "$APPS"

# Add separator if we have running apps
[[ -n "$menu" ]] && has_running=1 || has_running=0

# Add launchable apps (only check if command exists - fast)
launch_menu=""
launch_actions=""
while IFS='|' read -r key name icon class proc launch; do
    if ! is_running "$class" && command -v "$launch" >/dev/null 2>&1; then
        launch_menu+="$icon  Launch $name\n"
        launch_actions+="launch|$launch|$name\n"
    fi
done <<< "$APPS"

# Combine with separator
if [[ $has_running -eq 1 && -n "$launch_menu" ]]; then
    menu+="─────────────────\n"
    actions+="sep||\n"
fi
menu+="$launch_menu"
actions+="$launch_actions"

# Exit if nothing
[[ -z "$menu" ]] && { notify-send "App Manager" "No apps" -t 800; exit 0; }

# Show fuzzel
selection=$(echo -e "${menu%\\n}" | fuzzel --anchor=top-left --x-margin=10 --y-margin=48 \
    --dmenu --prompt "  " --width 32)

[[ -z "$selection" || "$selection" == "─────────────────" ]] && exit 0

# Find and execute action
idx=1
while IFS= read -r line; do
    menu_line=$(echo -e "$menu" | sed -n "${idx}p")
    if [[ "$menu_line" == "$selection" ]]; then
        action=$(echo -e "$actions" | sed -n "${idx}p")
        IFS='|' read -r cmd arg name <<< "$action"
        case "$cmd" in
            focus) hyprctl dispatch focuswindow "class:$arg" 2>/dev/null ;;
            close) pkill -f "$arg" 2>/dev/null ;;
            launch) eval "$arg > /dev/null 2>&1 &" ;;
        esac
        break
    fi
    ((idx++))
done <<< "$(echo -e "$menu")"
