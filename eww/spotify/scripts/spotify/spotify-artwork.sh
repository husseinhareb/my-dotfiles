#!/bin/bash

# Define the base directory
base_dir="/home/shtam/.config/eww/topbar/scripts/spotify/"

# Function to extract the album art URL from the metadata
get_album_art_url() {
    dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:"org.mpris.MediaPlayer2.Player" string:"Metadata" | \
    grep -A 1 "string \"mpris:artUrl\"" | \
    tail -n 1 | \
    cut -d '"' -f 2
}

