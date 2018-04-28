#!/bin/bash

# This is the script to run when the event ends. It will
# complete the following tasks:
#
#   1. Write the value contained in the counts file to
#      another file, along with the date.
#   2. Kill motion.
#
# It's unreasonable to write five of these scripts for each 
# mask, so instead a variable will be input to the script
# which represents the bottle to track.
#
#   Usage: onEventStart.sh <number representing the bottle>
#                            (an integer between 0 and 9)
#

ENDINGFILE="bubbleCounts/ending"
declare -i ENDING=$(cat $ENDINGFILE)
if [[ $ENDING -eq 0 ]]; then
    BUBBLECOUNTFILE="bubbleCounts/bubbleCount$1"
    DATE=$(date +"%d_%m_%Y")
    declare -i BUBBLECOUNT=$(cat $BUBBLECOUNTFILE)
    echo "$DATE	$BUBBLECOUNT" >> "bubbleCounts/countRecords$1"
    echo "1" > $ENDINGFILE
    service motion stop
fi
