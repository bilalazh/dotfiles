#!/bin/env bash

# A tiny delay just to make sure your text cursor is focused
sleep 0.2

# Check if Handy passed the text directly
if [ -n "$1" ]; then
    wtype "$1"
else
    # Fallback: type whatever is in the clipboard
    wtype "$(wl-paste)"
fi
