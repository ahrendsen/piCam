#!/bin/bash

if [ $# -lt 1 ]; then
	DATE='yesterday'
	echo -e "\n\nNo argument supplied. Uploading yesterday's data\n\n"
	sleep 5

	# Set the directory where your pictures are stored.
	MONTH=$(date +"%m" --date=$DATE)
	DAY=$(date +"%d" --date=$DATE)
	VIDEONAME="Autovideo_$MONTH-${DAY}_30fps.mp4"
	UPLOADFOLDER=$MONTH
else
	VIDEONAME=$1
	UPLOADFOLDER=$2
fi

VIDDIR=/home/pi/RbVideos

# The following lines will upload the video to cloud storage.
rclone copy $VIDDIR/$VIDEONAME unlbox:piCamPics/$UPLOADFOLDER
