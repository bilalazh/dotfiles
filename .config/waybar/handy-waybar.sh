#!/bin/bash

STATE_FILE="/tmp/handy_recording_state"
LOG_FILE="/tmp/handy_debug.log"

log() {
    echo "$(date '+%H:%M:%S') $1" >> "$LOG_FILE"
}

log "=== Script called with: $1"

# --- WAYBAR STATUS CHECK ---
if [ "$1" == "--status" ]; then
    STATE_EXISTS="false"
    if [ -f "$STATE_FILE" ]; then
        STATE_EXISTS="true"
    fi
    log "Status check: state_file_exists=$STATE_EXISTS"
    
    if [ "$STATE_EXISTS" = "true" ]; then
        log "Output: REC (recording class)"
        echo '{"text": "󰔊 REC", "class": "recording"}'
    else
        log "Output: MIC (idle class)"
        echo '{"text": "󰔊", "class": "idle"}'
    fi
    exit 0
fi

# --- TOGGLE LOGIC ---
if [ -f "$STATE_FILE" ]; then
    log "Toggle: removing state file, calling toggle to STOP"
    rm "$STATE_FILE"
    handy --toggle-transcription 2>/dev/null
    notify-send "Handy" "Recording stopped" -i microphone
else
    log "Toggle: creating state file, calling toggle to START"
    touch "$STATE_FILE"
    handy --toggle-transcription 2>/dev/null
    notify-send "Handy" "Recording started" -i microphone
fi
