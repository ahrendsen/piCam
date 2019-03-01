#/bin/bash

if [ $# -lt 1 ]; then
	DATE='yesterday'
    echo -e "\n\nNo argument supplied. Renaming yesterday's data (CTRL-c to cancel)\n\n"
    echo -e "\n\nCommand format: ./remotePull.sh <end date> <days before> <destination directory> <optional: Time(HR-MN-SS)>\n\n"
    echo -e "\n\nIf the optional time argument is supplied, only the files of that time are downloaded. * wildcards are accepted.  \n\n"
	sleep 5
elif [ $# -lt 4 ]; then
	DATE=$1
    DAYSBEFORE=$2
	DIRECTORY=$3
else
	DATE=$1
    DAYSBEFORE=$2
	DIRECTORY=$3
    TIME=$4
fi


MONTH=$(date +"%m" --date=$DATE)
echo "MONTH=$MONTH"
DAY=$(date +"%d" --date=$DATE)
echo "DAY=$DAY"
DIR="$DIRECTORY/${DAYSBEFORE}daysBefore$MONTH-$DAY"
mkdir -p "$DIR"

ITER=0
for n in $(seq $DAYSBEFORE -1 1); do
	MONTH=$(date +"%m" --date="$n day ago $DATE 00:00")
	DAY=$(date +"%d" --date="$n day ago $DATE 00:00")

	rclone copy --include *${TIME}.jpg unlbox:piCamPics/$MONTH/$DAY $DIRECTORY

	# Set this to the directory containing the images to compile
	PICDIR=$DIRECTORY
	# Leave this blank if only using one camera
	CAMERAEXTENSION=""
done

for f in ${PICDIR}/*_*-*[05]-*${CAMERAEXTENSION}.jpg; do 
	NAME=$(printf "%05d" ${ITER})
	cp "${f}" "$DIR/${NAME}.jpg"
	ITER=$((ITER+1)) 
done
