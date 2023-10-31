#!/bin/bash

# Define the character bars and the dictionary for replacements
bar="▁▂▃▄▅▆▇█"
replacement_dict="s/;//g;"

# Create the dictionary to replace characters with bars
for ((i=0; i<${#bar}; i++))
do
    replacement_dict="${replacement_dict}s/$i/${bar:$i:1}/g;"
done

# Ensure the FIFO pipe is clean
pipe="/tmp/cava.fifo"
if [ -p "$pipe" ]; then
    unlink "$pipe"
fi
mkfifo "$pipe"

# Define the Cava configuration file
config_file="/tmp/cava_config"
cat <<EOF > "$config_file"
[general]
bars = 26
[output]
method = raw
raw_target = $pipe
data_format = ascii
ascii_max_range = 7
EOF

# Run Cava in the background
cava -p "$config_file" &

# Read and process data from the FIFO
while read -r cmd; do
    echo "$cmd" | sed "$replacement_dict"
done < "$pipe"

# Clean up the FIFO when done (optional)
if [ -p "$pipe" ]; then
    unlink "$pipe"
fi
