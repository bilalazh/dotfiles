#!/bin/bash

# Check if waybar is currently running
if pgrep -x "swaync" > /dev/null
then
      pkill swaync
      swaync &
else
    swaync &

fi
