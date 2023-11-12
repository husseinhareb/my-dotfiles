#!/bin/bash

# Get the current microphone status
mic_status=$(pactl list sources | awk '/^Default Source:/ {print $3}')
mic_status="${mic_status:3}"
echo "Current microphone status: $mic_status"

# Toggle microphone status
if [ "$mic_status" == "yes" ]; then
  pactl set-source-mute @DEFAULT_SOURCE@ toggle
  echo "Microphone toggled (unmuted)"
else
  pactl set-source-mute @DEFAULT_SOURCE@ toggle
  echo "Microphone toggled (muted)"
fi
