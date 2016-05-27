#!/bin/bash
#
# This is a script to increment a number stored
# in a file by one. It will be called when I 
# detect motion on the camera, signifying that 
# a bubble has escaped the carboy. 

# Gets the start count from the file, converting it to a BASH
# integer (-i) for easy incrementing. Note that if the number
# has a leading zero, it will automatically be interpreted as
# an octal number, unless the format is specified, as
# exemplified below in the printf statement
FILE="/home/karl/piCam/cam/motion/bubbleCounts/bubbleCount$1"
declare -i BUBBLECOUNT=$(cat $FILE)

# Increment the integer
BUBBLECOUNT=$BUBBLECOUNT+1

# Write the new integer over the previous one,
# formatting it so that files stay nicely sorted.
printf "10#%03d" $BUBBLECOUNT > $FILE
