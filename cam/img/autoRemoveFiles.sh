#!/bin/bash

if [ $# -lt 1 ]; then 
	n=14
	MONTH=$(date +"%m" --date="$n day ago $DATE 00:00")
	DAY=$(date +"%d" --date="$n day ago $DATE 00:00")
	PICDIR=$HOME/PiPics/$MONTH/$DAY
fi

rm $PICDIR/*_*_[^1]*-*-*.jpg
rm $PICDIR/*_*_*[^2]-*-*.jpg
rm $PICDIR/*_*_*-[^0]*-*.jpg
rm $PICDIR/*_*_*-?5-*.jpg
rm ~/AutoGif/*_$MONTH-${DAY}_*.gif
rm ~/PiVideos/*_$MONTH-${DAY}_*.mp4
yes | sudo rm $PICDIR/renamed/*.jpg
rmdir $PICDIR/renamed
