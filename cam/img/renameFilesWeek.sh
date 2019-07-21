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
DIR="$HOME/PiPics/$MONTH/weekBefore$DAY"
mkdir -p "$DIR"

ITER=0
for n in $(seq 7 -1 1); do
	MONTH=$(date +"%m" --date="$n day ago $DATE 00:00")
	DAY=$(date +"%d" --date="$n day ago $DATE 00:00")

	# Set this to the directory containing the images to compile
	PICDIR=$HOME/PiPics/$MONTH/$DAY
	# Leave this blank if only using one camera
	CAMERAEXTENSION=""

	# An iteration variable.
	for f in ${PICDIR}/*_*-*[05]-*${CAMERAEXTENSION}.jpg; do 
		NAME=$(printf "%05d" ${ITER})
		sudo cp "${f}" "$DIR/${NAME}.jpg"
		ITER=$((ITER+1)) 
	done
done
