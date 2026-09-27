#!/bin/bash

# THIS SCRIPT WILL INCREASE THE BACKLIGHT BY 500
#
# brightnessctl errors if we go past max, so clamp to max instead
# 500 is the step size

CURRENT=$(brightnessctl get)
MAX=$(brightnessctl max)

if [ $(( CURRENT + 500 )) -gt "$MAX" ]; then

  brightnessctl set $MAX

else

  brightnessctl set $(( CURRENT + 500 ))

fi

# Notification with no text, just the current value
# notify-send "" "<span weight='bold'>$(brightnessctl get)</span>"
