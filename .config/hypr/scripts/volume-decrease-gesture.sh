#!/bin/bash

# THIS SCRIPT WILL DECRESE THE VOLUME 
#
# This script will allow you to change the volume  1 percent and also show the notification and Current Volume Level 
# wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+   This command is used to increase the volume by 1 percent

# Frist just increase the volume by 1 percent 
wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-

# Now we need to get the current volume level
CURRENT_VOLUME_LEVEL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk  '{print $2}')

# echo $CURRENT_VOLUME_LEVEL 

# Documentation for this one liner 
# we just use echo CURENT_VOLUME_LEVEL *100   and pipe it to bc 
# awk  print with int just trancuated the interger part so that we can display it clealy

PERCENTAGE=$(echo "$CURRENT_VOLUME_LEVEL *100" | bc | awk '{print int($1)}' )

 notify-send "Volume -1% " "<span color='#fb4934' weight='bold'>🔈 $PERCENTAGE</span>"

