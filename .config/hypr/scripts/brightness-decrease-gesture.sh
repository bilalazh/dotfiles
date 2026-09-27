#!/bin/bash

# THIS SCRIPT WILL DECREASE THE BACKLIGHT BY 500
#
# brightnessctl errors if we go below 0, so clamp to 0 instead
# 500 is the step size

CURRENT=$(brightnessctl get)

if [ $(( CURRENT - 500 )) -lt 1 ]; then

  brightnessctl set 0

else

  brightnessctl set $(( CURRENT - 500 ))

fi

# Notification with no text, just the current value
# notify-send "" "<span weight='bold'>$(brightnessctl get)</span>"
