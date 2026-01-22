#!/bin/bash

# Kill any running Waybar instances
pkill waybar

# Start Waybar and disown the process
waybar & disown

# Optional: wait a bit for Waybar to start
sleep 0.5
