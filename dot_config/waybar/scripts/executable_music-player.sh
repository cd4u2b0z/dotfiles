#!/bin/bash
# Dynamic Music Player for Waybar
# Shows currently playing track from Spotify/ncspot, hides when nothing playing

# Function to escape Pango markup characters
escape_pango() {
    echo "$1" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g'
}

# Check if any player is running
if ! playerctl status &>/dev/null; then
    echo '{"text": "", "class": "hidden"}'
    exit 0
fi

STATUS=$(playerctl status 2>/dev/null)
if [[ "$STATUS" != "Playing" && "$STATUS" != "Paused" ]]; then
    echo '{"text": "", "class": "hidden"}'
    exit 0
fi

# Get metadata and escape for Pango
ARTIST_RAW=$(playerctl metadata artist 2>/dev/null | cut -c1-25)
TITLE_RAW=$(playerctl metadata title 2>/dev/null | cut -c1-30)
ALBUM_RAW=$(playerctl metadata album 2>/dev/null)
PLAYER=$(playerctl metadata --format '{{playerName}}' 2>/dev/null)

ARTIST=$(escape_pango "$ARTIST_RAW")
TITLE=$(escape_pango "$TITLE_RAW")
ALBUM=$(escape_pango "$ALBUM_RAW")

# Icon based on player and status
if [[ "$STATUS" == "Playing" ]]; then
    if [[ "$PLAYER" == *"spotify"* || "$PLAYER" == *"ncspot"* ]]; then
        ICON=""
    else
        ICON="󰎈"
    fi
else
    ICON=""
fi

# Build display text
if [[ -n "$ARTIST" && -n "$TITLE" ]]; then
    TEXT="$ICON  $ARTIST - $TITLE"
elif [[ -n "$TITLE" ]]; then
    TEXT="$ICON  $TITLE"
else
    echo '{"text": "", "class": "hidden"}'
    exit 0
fi

# Tooltip with full info
TOOLTIP="$TITLE\\n$ARTIST\\n$ALBUM"

# Class for styling
CLASS="playing"
[[ "$STATUS" == "Paused" ]] && CLASS="paused"

echo "{\"text\": \"$TEXT\", \"tooltip\": \"$TOOLTIP\", \"class\": \"$CLASS\"}"
