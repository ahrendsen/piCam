#!/bin/bash

# Before a video can be compiled, you must rename the files to be in an integer ascending order.
# run the script renameFiles.sh before running this script.
if [ $# -lt 1 ]; then
	DATE='yesterday'
	echo -e "\n\nNo argument supplied. Compiling yesterday's data\n\n"
	sleep 5

	# Set the directory where your pictures are stored.
	MONTH=$(date +"%m" --date=$DATE)
	DAY=$(date +"%d" --date=$DATE)

	PICDIR=/home/pi/RbPics/$MONTH/$DAY/renamed
	VIDEONAME="Autovideo_$MONTH-${DAY}_${FRAMERATEOUT}fps.mp4"
else
	PICDIR=$1
	VIDEONAME=$2
fi

# Directory where you want the video to be saved. Make sure it already exists. 
VIDDIR=/home/pi/RbVideos
mkdir -p "${VIDDIR}"

#VIDEO OPTIONS
FRAMERATEIN=30
FRAMERATEOUT=$FRAMERATEIN
# Set the name that you want your video to have. 

sudo avconv -f image2 -r $FRAMERATEIN -i ${PICDIR}/%05d.jpg -vf scale=480:270 -b:v 1M -r:v $FRAMERATEOUT -c:v mpeg4 -qp 0 -preset veryslow -an "${VIDDIR}/${VIDEONAME}"
