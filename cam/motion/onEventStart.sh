#!/bin/bash

# This is the script to run when the event starts. It will
# complete the following tasks:
#
#   1. Sets the counts file to zero.
#   2. ???
#   3. Profit.
#
# It's unreasonable to write five of these scripts for each 
# mask, so instead a variable will be input to the script
# which represents the bottle to track.
#
#   Usage: onEventStart.sh <number representing the bottle>
#                            (an integer between 0 and 9)
#

echo "0" > "bubbleCounts/bubbleCount$1"
echo "0" > "bubbleCounts/ending"
