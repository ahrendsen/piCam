#/bin/bash


DIR="/home/pi/RbPics/rolling"
mkdir -p "$DIR"

ITER=0

# Set this to the directory containing the images to compile
PICDIR=/home/pi/RbPics
# Leave this blank if only using one camera
CAMERAEXTENSION=""

# An iteration variable.
for f in $( ls ~/RbPics/[0-9][0-9]/[0-9][0-9]/*.jpg | tail -n 144 ); do 
	NAME=$(printf "%05d" ${ITER})
	sudo cp "${f}" "$DIR/${NAME}.jpg"
	ITER=$((ITER+1)) 
done
