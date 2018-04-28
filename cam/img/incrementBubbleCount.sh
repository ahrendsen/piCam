#!/bin/bash
#
# This is a script to increment a number stored in a hidden file by 1.
# It will be used to ensure that I do not overwrite images stored on 
# the Pi when shutting down by just unplugging the Pi. It Seems that 
# doing this doesn't save the minutes, though if an hour of time
# elapses with the Pi on, this hour change will be saved. 

# Gets the start count from the file, converting it to a BASH
# integer (-i) for easy incrementing. Note that if the number
# has a leading zero, it will automatically be interpreted as
# an octal number
touch /home/karl/.bubbleCount
declare -i STARTCOUNT=$(cat /home/karl/.bubbleCount)

# I'm suspicious that if the system is slow to start up that it might
# say that .startCount doesn't exist and $STARTCOUNT would then be zero.
# To avoid this, don't move forward until startcount has a number, 
# as it always should have.
while [ "$STARTCOUNT" == 0 ]; do
	declare -i STARTCOUNT=$(cat /home/karl/.bubbleCount)
done

# Increment the integer
STARTCOUNT=$STARTCOUNT+1

# Write the new integer over the previous one,
# formatting it so that files stay nicely sorted.
sudo printf "10#%03d" $STARTCOUNT > /home/karl/.bubbleCount
