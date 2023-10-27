#!/bin/bash

# Check if iftop is installed
if ! command -v iftop &>/dev/null; then
    echo "iftop is not installed. You can install it using your package manager (e.g., 'apt-get install iftop' on Debian/Ubuntu)."
    exit 1
fi

# Run iftop and capture the output
sudo iftop -t -s 1 -n -N 2> /dev/null | awk '/Total send rate:/ { upload_speed = $6; } /Total receive rate:/ { download_speed = $6; } END { print "Upload Speed: " upload_speed " / Download Speed: " download_speed; }'
