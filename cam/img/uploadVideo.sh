#!/bin/bash

#Get the month to help separate all of the photos into dirs.
MONTH=$(date +"%m" --date='yesterday')
#Get the day of the month to help separate all of the photos into dirs.
DAY=$(date +"%d" --date='yesterday')
DATEFOLDERS=${MONTH}/${DAY}

VIDDIR=/home/pi/RbVideos
VIDEONAME="Autovideo_$MONTH-$DAY"

# The following lines will upload the video to cloud storage.
rclone copy $VIDDIR/$VIDEONAME.mp4 unlbox:piCamPics/$DATEFOLDERS
