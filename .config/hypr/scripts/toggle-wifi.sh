#!/bin/env bash


# -e: immediately exit if any command has a non-zero exit status
# -u: treat unset variables as an error and exit immediately
# -o pipefail: causes a pipeline to exit with the status of the rightmost command 
# in the pipeline that returns a non-zero status, or the status of the pipeline itself
# if the pipeline exits due to a non-zero return value
set -euo pipefail



# check the current status of the wifi
STAT=$(nmcli radio wifi | awk '{print $1}')

# if the wifi is disabled, enable it
if [[ "$STAT" = "disabled" ]]; then
 

    # echo "WiFi is ${STAT}"
    nmcli radio wifi on

    SATUS="ENABLED"
    # notify the user that wifi has been turned on
    notify-send "WiFi has been ${SATUS}"

# if the wifi is enabled, disable it
else 

   
    nmcli radio wifi off
    # set the status to disabled
    SATUS="DISABLED"

    # notify the user that wifi has been turned off
    # echo "WiFi is ${SATUS}" 
    # send the notification
    notify-send "WiFi is ${SATUS}"

fi



