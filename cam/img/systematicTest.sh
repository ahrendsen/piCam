#!/bin/bash

#Record the number of cameras that are connected to the computer
CAMCOUNT=$(ls /dev | grep -c video)

if [ "$CAMCOUNT" -gt 0 ]; then
	#Get the date in a string format to be used in the filename
	DATE=$(date +"%Y%m%d%H%M%S")
	#Get the month to help separate all of the photos into dirs.
	MONTH=$(date +"%m")
	#Get the day of the month to help separate all of the photos into dirs.
	DAY=$(date +"%d")
	#Get the hour of the day for the same reason.
	HOUR=$(date +"%H")

	# Pulls a number stored in a file which represents the number of 
	# times the system has been powered on. This should prevent
	# images from overwriting each other when the Pi is powered
	# off without sudo shutdown.
	declare -i STARTCOUNT=$(cat /home/pi/.startCount)
	SCSTRING=$(printf "%04d" $STARTCOUNT)


	# The base directory where the folders to store the pictures will be made.
	BASEDIR=/home/pi/rackhamFolder
	#BASEDIR=/home/pi/stopMotionWebcam/img/$MONTH_$DAY
	sudo mkdir -p $BASEDIR

	# The number of images to skip before actually taking the picture.
	# This helps the camera to adjust to sudden harsh light changes. 
	# For applications that take images infrequently (every minute),
	# a large number (around 20) will be best. For more frequent picture
	# taking, a value of 4 or so will do.
	SKIPCOUNT=10
	SKIPSET="-S $SKIPCOUNT"

	# The number of frames to grab to compose the image
	# more frames will make a less noisy image, but this
	# can only be used with stationary objects.
	# It seems that after a certain point, the image noise
	# can't be reduced much further. After comparing several
	# images, I have decided that 5-6 images gives a 
	# noticeable reduction in noise, and anything more than
	# that is difficult to notice the difference.
	FRAMECOUNT=6
	FRAMESET="-F $FRAMECOUNT"

	# If the camera is set up in a controlled environment, you 
	# can find brightness settings that work best and then 
	# always use those settings. Not recommended when using the camera
	# outdoors. Set these strings to empty to disable.
	#
	# For a simple setup with a single incandescent lightbulb very close
	# to the subject, a value of 80 seems to work best. 
	BR=$1
	BRIGHTSET="-s brightness=$BR"

	# Contrast
	# This is probably really subjective, but I found that
	# a value of 6 was most pleasing to my eye. The system was
	# defaulting to 4 when taking pictures of the brew.
	CONTRAST=$2
	CONTRASTSET="-s contrast=$CONTRAST"

	# Saturation
	# The automatically selected value seemed to work well for the brew wall.
	# I'll stick with 65
	SAT=$3
	SATSET="-s saturation=$SAT"

	# Sharpness
	# The default was 25 (out of 50) and though there wasn't much
	# difference between the photos except for the one taken at the lowest
	# sharpness I thought the higher values looked a little better.
	SH=$4
	SHARPSET="-s sharpness=$SH"

	# Backlight Compensation
	# Previously I didn't think I would have to bother with this, 
	# but now since I have the meads backlit, I should probably play
	# around with this parameter as well to see if I can get a better
	# picture
	BC=$5
	BACKCOMPSET="-s 'backlight compensation'=$BC"

	# A unique ID for the picture that will comprise part of the filename.
	PICID="${SCSTRING}${DATE}_BR-${BR}_CON-${CONTRAST}_SAT-${SAT}_SHRP-${SH}_BL-${BC}"

	SETTINGSBOTH="-q -r 1280x720 --no-banner $FRAMESET $SKIPSET $BRIGHTSET $CONTRASTSET $SATSET $SHARPSET $BACKCOMPSET"
	SETTINGS1="-d /dev/video0"
	SETTINGS2="-d /dev/video1"

	if [ "$CAMCOUNT" -eq 2 ]; then
		sudo fswebcam $SETTINGSBOTH $SETTINGS1 $BASEDIR/${PICID}_0.jpg
		#sudo fswebcam $SETTINGSBOTH $SETTINGS2 $BASEDIR/${PICID}_1.jpg
	elif [ "$CAMCOUNT" -eq 1 ]; then 
		#Record the name of the first attached camera
		CAMNAME=$(ls /dev | grep video)

		fswebcam -d /dev/$CAMNAME $SETTINGSBOTH $BASEDIR/${PICID}.jpg
	fi
fi
