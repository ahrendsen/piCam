#!/bin/bash

if [ $# -lt 1 ]; then
	DATE='yesterday'
	echo -e "\n\nNo argument supplied. Uploading yesterday's data\n\n"
	sleep 5

	# Set the directory where your pictures are stored.
	MONTH=$(date +"%m" --date=$DATE)
	DAY=$(date +"%d" --date=$DATE)


	GIFNAME="AutoGif_$MONTH-${DAY}_30fps.gif"
	UPLOADFOLDER=$MONTH
else
	GIFNAME=$1
	UPLOADFOLDER=$2
fi

GIFDIR=$HOME/AutoGif

# The following lines will upload the gif to cloud storage.
rclone copy $GIFDIR/$GIFNAME unlbox:piCamPics/$UPLOADFOLDER
