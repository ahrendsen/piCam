
#cd /home/karl/Dropbox/tether
#gphoto2 --capture-image  -v&
#sleep 10; pkill -f gphoto2;
#sleep 1;
#NUMBERSTRING=$( gphoto2 --num-files --folder /DCIM/496CANON | grep --only-matching :.*[[:digit:]*] )
#NUMBER=${NUMBERSTRING/": "/""}
#gphoto2 --get-file=$NUMBER --filename %Y%m%dT%H%M%S.%C --folder /DCIM/496CANON
#gphoto2 --delete-file=$NUMBER --folder /DCIM/496CANON

#/bin/bash
cd /home/karl/autoPic
IMAGEFOLDER=/DCIM
SHUTTERSPEED=10
GPHOTOOPTS="$1 $2 --quiet --folder $IMAGEFOLDER"

pkill -f gphoto2; sleep 1;
AUTOFOLDERNAME=$( gphoto2 $GPHOTOOPTS --list-folders --no-recurse | grep --only-matching [[:digit:]]*[[:alnum:]]* | tail -n 1 )
FOLDERNAME=$IMAGEFOLDER/$AUTOFOLDERNAME
GPHOTOOPTS="$1 $2 --quiet --folder $FOLDERNAME"
sleep $SHUTTERSPEED; pkill -f gphoto2; pkill -f gphoto2; pkill -f gphoto2;
sleep 3

echo $FOLDERNAME
# Capture image
gphoto2 --capture-image $GPHOTOOPTS &
# Wait for capture, kill hanging process
sleep $SHUTTERSPEED; pkill -f gphoto2; pkill -f gphoto2; pkill -f gphoto2;

# Next two lines obtains the last collected image number.
#NUMBER=$( gphoto2 $GPHOTOOPTS --num-files | grep --only-matching [[:digit:]]*$ )
#NUMBER=$(($NUMBER + 1))
sleep 1
# Obtain the image from the camera
gphoto2 $GPHOTOOPTS --get-file=1 --filename %Y%m%dT%H%M%S.%C
sleep 1
# Delete the image from the camera
gphoto2 $GPHOTOOPTS --delete-file=1
