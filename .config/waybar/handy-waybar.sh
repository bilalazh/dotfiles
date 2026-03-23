#!/bin/bash

STATE_FILE="/tmp/handy_recording_state"

# --- WAYBAR STATUS CHECK ---
# Waybar calls this every 1 second to decide which icon/color to show
if [ "$1" == "--status" ]; then
    if [ -f "$STATE_FILE" ]; then
        echo '{"text": "󰔊 REC", "class": "recording"}'
    else
        echo '{"text": "󰔊 MIC", "class": "idle"}'
    fi
    exit 0
fi

# --- TOGGLE LOGIC ---
if [ ! -f "$STATE_FILE" ]; then
    # Start Recording
    touch "$STATE_FILE"
    handy --toggle-transcription 2>/dev/null
else
    # Stop Recording
    rm "$STATE_FILE"
    handy --toggle-transcription 2>/dev/null
    notify-send "Handy" "Transcription Ready (Ctrl+V to paste)" -i accessories-text-editor
fi
