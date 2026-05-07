#!/bin/bash
# Script: Seek to a percentage position in the currently playing track

P=$1

# No argument? Print track length and exit
if [ -z "$P" ]; then
    LENGTH=$(playerctl metadata mpris:length)
    echo "Track length: $(( LENGTH / 1000000 ))s"
    exit 0
fi

# Get track length in microseconds, convert to seconds
LENGTH=$(playerctl metadata mpris:length)
LENGTH_SEC=$(( LENGTH / 1000000 ))

# Calculate target second from percentage
# Formula: (percent * total_seconds) / 100 = target_second
# Why /100? Because "50%" means "50 out of 100" = 0.50 of the whole
# Example: 50% of 98s track = (50 * 98) / 100 = 49 seconds
TARGET=$(( (P * LENGTH_SEC) / 100 ))

# Jump to that position
playerctl position $TARGET
