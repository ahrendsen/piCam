#!/bin/bash

# Before a video can be compiled, you must rename the files to be in an integer ascending order.
# run the script renameFiles.sh before running this script.

# Set the directory where your pictures are stored.
PICDIR=/home/pi/RbPics/08
# Directory where you want the video to be saved. Make sure it already exists. 
VIDDIR=/home/pi/RbVideos
# I choose to put the renamed pictures in a subdirectory, if your files are already numbered in the PICDIR directory, set this to "".
SUBDIR=renamed
# Set the name that you want your video to have. 
VIDEONAME=RubidiumBoil

sudo avconv -f image2 -r 12 -i ${PICDIR}/${SUBDIR}/%05d.jpg -vf scale=480:270 -b:v 1M -r:v 29.976 -c:v mpeg4 -qp 0 -preset veryslow -an "${VIDDIR}/${VIDEONAME}.mp4"
