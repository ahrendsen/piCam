#/bin/bash

MONTH=$(date +"%m" --date='yesterday')
DAY=$(date +"%d" --date='yesterday')
TIME=08-35

# Set this to the directory containing the images to compile
PICDIR=$HOME/PiPics
# Leave this blank if only using one camera
CAMERAEXTENSION=""

# An iteration variable.
ITER=0
for f in ${PICDIR}/*/*/*_$TIME-*${CAMERAEXTENSION}.jpg; do 
	NAME=$(printf "%05d" ${ITER})
	mkdir -p "${PICDIR}/${TIME}renamed"
	sudo cp "${f}" "${PICDIR}/${TIME}renamed/${NAME}.jpg"
	ITER=$((ITER+1)) 
done
