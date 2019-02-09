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

GIFDIR=/home/pi/AutoGif
GIFNAME="AutoGif_$MONTH-${DAY}_30fps.gif"

# The following lines will upload the gif to cloud storage.
rclone copy $GIFDIR/$GIFNAME unlbox:piCamPics/$MONTH
