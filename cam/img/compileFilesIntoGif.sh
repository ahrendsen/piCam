#!/bin/bash

# Before a video can be compiled, you must rename the files to be in an integer ascending order.
# run the script renameFiles.sh before running this script.
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

PICDIR=/home/pi/RbPics/$MONTH/$DAY
# Directory where you want the video to be saved. Make sure it already exists. 
GIFDIR=/home/pi/AutoGif
mkdir -p "${GIFDIR}"

#VIDEO OPTIONS
FRAMERATE=30
# Set the name that you want your video to have. 
GIFNAME="AutoGif_$MONTH-${DAY}_${FRAMERATE}fps.gif"

ffmpeg -framerate $FRAMERATE -pattern_type glob -i "${PICDIR}/renamed/*.jpg" -r 15 -vf scale=512:-1 ${GIFDIR}/$GIFNAME
