#!/bin/bash

# Before a video can be compiled, you must rename the files to be in an integer ascending order.
# run the script renameFiles.sh before running this script.

# Set the directory where your pictures are stored.
MONTH=$(date +"%m" --date='yesterday')
DAY=$(date +"%d" --date='yesterday')

PICDIR=/home/pi/RbPics/$MONTH/$DAY
# Directory where you want the video to be saved. Make sure it already exists. 
VIDDIR=/home/pi/RbVideos
mkdir -p "${VIDDIR}"

#VIDEO OPTIONS
FRAMERATE=30
# Set the name that you want your video to have. 
VIDEONAME="Autovideo_$MONTH-${DAY}_${FRAMERATE}fps.mp4"

sudo avconv -f image2 -r $FRAMERATE -i ${PICDIR}/renamed/%05d.jpg -vf scale=480:270 -b:v 1M -r:v 29.976 -c:v mpeg4 -qp 0 -preset veryslow -an "${VIDDIR}/${VIDEONAME}"
