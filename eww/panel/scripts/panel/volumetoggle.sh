#!/bin/bash

# Get the default sink name
default_sink=$(pactl info | grep 'Default Sink' | cut -d: -f2 | tr -d ' ')

# Get the current mute status
mute_status=$(pactl list sinks | grep -A 15 "Name: $default_sink" | grep 'Mute:' | awk '{print $2}')

# Toggle the mute status
if [ "$mute_status" = "yes" ]; then
    # If currently muted, unmute
    pactl set-sink-mute "$default_sink" 0
else
    # If currently unmuted, mute
    pactl set-sink-mute "$default_sink" 1
fi
