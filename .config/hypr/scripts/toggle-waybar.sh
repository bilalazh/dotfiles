#!/bin/bash

# Check if waybar is currently running
if pgrep -x "waybar" > /dev/null
then
    # If it IS running, kill it
    killall waybar
else
    # If it is NOT running, launch it in the background
    waybar &
fi
