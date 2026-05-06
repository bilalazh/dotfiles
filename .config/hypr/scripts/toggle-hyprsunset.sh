#!/bin/bash
#
#if hyprsunset is already running dont run it otherwise run it
#
#

if pgrep -x "hyprsunset" > /dev/null

then
 pkill hyprsunset

else

hyprsunset -t 3500k --gamma 30 &

fi
