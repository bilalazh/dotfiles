#!/bin/bash
# Toggle between workspace 1 and workspace 9

CURRENT=$(hyprctl activeworkspace -j | jq '.id')

if [ "$CURRENT" = "9" ]; then
    hyprctl dispatch workspace 1
else
    hyprctl dispatch workspace 9
fi
