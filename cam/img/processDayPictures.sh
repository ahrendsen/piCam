#!/bin/bash

if [ $# -lt 1 ]; then
	DATE='yesterday'
	echo -e "\n\nNo argument supplied. Processing yesterday's data\n\n"
	sleep 5
else
	DATE=$1
fi

./renameFiles.sh $DATE
./compileFilesIntoVideo.sh $DATE
./uploadVideo.sh $DATE
