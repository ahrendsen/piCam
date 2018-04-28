#!/bin/bash
#
# This is a script to reset the start count. 

# Gets the start count from the file, converting it to a BASH
# integer (-i) for easy incrementing.
touch /home/pi/.startCount

# Increment the integer
STARTCOUNT=0

# Write the new integer over the previous one,
# formatting it so that files stay nicely sorted.
sudo printf "%d" $STARTCOUNT > /home/pi/.startCount
