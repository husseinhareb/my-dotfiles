#!/bin/bash

while true; do
    # Use iw to get WiFi information and grep for the bandwidth
    wifi_info=$(iw dev wlp0s20f3 link | grep "tx bitrate")

    # Extract and display the bandwidth information
    bandwidth=$(echo $wifi_info | awk '{print $3}')
    echo "WiFi Bandwidth: $bandwidth"

    # Sleep for one second before the next update
    sleep 1
done
