#!/bin/sh
pkill -x swaybg || true
IMG_FILE="$(find /home/bi/dotfiles/.config/hypr/images/ -type f | shuf -n 1)"
[ -n "$IMG_FILE" ] && swaybg -i "$IMG_FILE" -m fill &
