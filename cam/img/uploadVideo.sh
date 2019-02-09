#!/bin/bash

if [ $# -lt 1 ]; then
	DATE='yesterday'
	echo -e "\n\nNo argument supplied. Compiling yesterday's data\n\n"
	sleep 5
else
	DATE=$1
fi

# Set the directory where your pictures are stored.
MONTH=$(date +"%m" --date=$DATE)
DAY=$(date +"%d" --date=$DATE)

VIDDIR=/home/pi/RbVideos
VIDEONAME="Autovideo_$MONTH-${DAY}_30fps.mp4"

# The following lines will upload the video to cloud storage.
rclone copy $VIDDIR/$VIDEONAME unlbox:piCamPics/$MONTH
