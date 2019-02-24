#/bin/bash

if [ $# -lt 1 ]; then 
	HOURS=12
else
	HOURS=$1
fi

DIR="$HOME/PiPics/rolling$HOURS"
mkdir -p "$DIR"
rm -f $DIR/*.jpg

ITER=0

# Set this to the directory containing the images to compile
PICDIR=$HOME/PiPics
# Leave this blank if only using one camera
CAMERAEXTENSION=""

# An iteration variable.
for f in $( ls $PICDIR/[0-9][0-9]/[0-9][0-9]/*.jpg | tail -n $(( $HOURS * 12 )) ); do 
	#NAME=$(printf "%05d" ${ITER})
	#cp "${f}" "$DIR/${NAME}.jpg"
	#ITER=$((ITER+1)) 
	echo $f
done
