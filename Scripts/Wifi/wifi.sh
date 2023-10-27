#!/bin/bash

# Check if speedtest-cli is installed
if ! command -v speedtest-cli &>/dev/null; then
    echo "speedtest-cli is not installed. You can install it using 'pip install speedtest-cli'."
    exit 1
fi

# Run the speed test
echo "Running speed test..."
speedtest-cli --simple > /tmp/speedtest_results.txt

# Check if the speed test was successful
if [ $? -ne 0 ]; then
    echo "Speed test failed. Check your internet connection or try again later."
    exit 1
fi

# Extract upload and download speeds from the results
download_speed=$(grep "Download" /tmp/speedtest_results.txt | cut -d " " -f 2)
upload_speed=$(grep "Upload" /tmp/speedtest_results.txt | cut -d " " -f 2)

# Print the results
echo "Download Speed: $download_speed"
echo "Upload Speed: $upload_speed"

# Clean up temporary file
rm /tmp/speedtest_results.txt
