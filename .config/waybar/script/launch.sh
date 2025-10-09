#!/bin/bash

# Kill any running Waybar instances
pkill waybar

# Start Waybar and disown the process
waybar & disown
