#!/bin/bash

# Get the current volume level
volume=$(pactl list sinks | grep 'Volume:' | head -n 1 | awk '{print $5}' | sed 's/%//')

# Define volume icons
mute_icon="󰖁"
low_icon="󰕿"
medium_icon="󰖀"
high_icon="󰕾"

# Check if the speaker is muted
if [ $volume -eq 0 ]; then
  icon=$mute_icon
elif [ $volume -lt 30 ]; then
  icon=$low_icon
elif [ $volume -lt 70 ]; then
  icon=$medium_icon
else
  icon=$high_icon
fi

# Display the volume icon and level
echo "$icon$volume%"
