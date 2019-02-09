#!/bin/bash

# Before a video can be compiled, you must rename the files to be in an integer ascending order.
# run the script renameFiles.sh before running this script.

# Set the directory where your pictures are stored.
MONTH=$(date +"%m" --date='yesterday')
DAY=$(date +"%d" --date='yesterday')
TIME=08-35

PICDIR=/home/pi/RbPics/${TIME}renamed
# Directory where you want the video to be saved. Make sure it already exists. 
GIFDIR=/home/pi/AutoGif
mkdir -p "${GIFDIR}"

#VIDEO OPTIONS
FRAMERATE=30
# Set the name that you want your video to have. 
GIFNAME="AutoGif_TIME=${TIME}_${FRAMERATE}fps.gif"

ffmpeg -framerate $FRAMERATE -pattern_type glob -i "${PICDIR}/*.jpg" -r 15 -vf scale=512:-1 ${GIFDIR}/$GIFNAME
