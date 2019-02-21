#!/bin/bash
#
# Usage ./compileFilesIntoGif.sh <folder containing jpgs> <GIF filename> 

# Before a video can be compiled, you must rename the files to be in an integer ascending order.
# run the script renameFiles.sh before running this script.
if [ $# -lt 2]; then
	DATE='yesterday'
	echo -e "\n\nNo argument supplied. Compiling yesterday's data\n\n"
	sleep 5

	# Set the directory where your pictures are stored.
	MONTH=$(date +"%m" --date=$DATE)
	DAY=$(date +"%d" --date=$DATE)
	DIR=$MONTH/$DAY

	NAME="AutoGif_$MONTH-${DAY}_${FRAMERATE}fps.gif"

else
	DIR=$1
	NAME=$2
fi


PICDIR=/home/pi/RbPics/$DIR
# Directory where you want the video to be saved. Make sure it already exists. 
GIFDIR=/home/pi/AutoGif
mkdir -p "${GIFDIR}"

#VIDEO OPTIONS
FRAMERATE=30
# Set the name that you want your video to have. 
GIFNAME=$NAME

ffmpeg -framerate $FRAMERATE -pattern_type glob -i "${PICDIR}/*.jpg" -r 15 -vf scale=512:-1 ${GIFDIR}/$GIFNAME
