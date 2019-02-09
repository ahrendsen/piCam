#/bin/bash

if [ $# -lt 1 ]; then
	DATE='yesterday'
	echo -e "\n\nNo argument supplied. Renaming yesterday's data\n\n"
	sleep 5
else
	DATE=$1
fi

MONTH=$(date +"%m" --date=$DATE)
DAY=$(date +"%d" --date=$DATE)

# Set this to the directory containing the images to compile
PICDIR=/home/pi/RbPics/$MONTH/$DAY
# Leave this blank if only using one camera
CAMERAEXTENSION=""

# An iteration variable.
ITER=0
for f in ${PICDIR}/*_*-*[05]-*${CAMERAEXTENSION}.jpg; do 
	NAME=$(printf "%05d" ${ITER})
	mkdir -p "${PICDIR}/renamed"
	sudo cp "${f}" "${PICDIR}/renamed/${NAME}.jpg"
	ITER=$((ITER+1)) 
done
