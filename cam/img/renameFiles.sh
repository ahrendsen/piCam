#/bin/bash

# Set this to the directory containing the images to compile
PICDIR=/home/pi/RbPics/08
# Leave this blank if only using one camera
CAMERAEXTENSION=""

# An iteration variable.
ITER=0
for f in ${PICDIR}/*${CAMERAEXTENSION}.jpg; do 
	NAME=$(printf "%05d" ${ITER})
	mkdir -p "${PICDIR}/renamed"
	sudo cp "${f}" "${PICDIR}/renamed/${NAME}.jpg"
	ITER=$((ITER+1)) 
done