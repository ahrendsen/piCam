#/bin/bash

if [ $# -lt 1 ]; then 
	HOURS=12
else
	HOURS=$1
fi

DIR="/home/pi/RbPics/rolling"
mkdir -p "$DIR"

ITER=0

# Set this to the directory containing the images to compile
PICDIR=$HOME/RbPics
# Leave this blank if only using one camera
CAMERAEXTENSION=""

# An iteration variable.
for f in $( ls $PICDIR/*/*/*.jpg | tail -n $(( $HOURS * 12 )) ); do 
	NAME=$(printf "%05d" ${ITER})
	sudo cp "${f}" "$DIR/${NAME}.jpg"
	ITER=$((ITER+1)) 
done
