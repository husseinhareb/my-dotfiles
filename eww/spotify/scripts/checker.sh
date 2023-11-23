#!/bin/bash

songName=$(playerctl -p spotify metadata --format "{{ title }}")
file="$HOME/.config/eww/spotify/scripts/name.txt"

# Read the first line from the file if it exists
if [ -f "$file" ]; then
    previousSong=$(head -n 1 "$file")
else
    previousSong=""
fi

# Update the file with the current song name
echo "$songName" > "$file"

# Compare the current and previous song names
if [ "$songName" != "$previousSong" ]; then
    # Run the script when the song changes
    echo "$HOME/.config/eww/spotify/scripts/image.png"
    "$HOME/.config/eww/spotify/scripts/spotify-artwork.sh"
fi
echo "$HOME/.config/eww/spotify/scripts/image.png"
