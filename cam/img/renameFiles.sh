#/bin/bash

ITER=0
PICDIR=/home/karl/testDir/04

for f in ${PICDIR}/*_0.jpg; do 
	NAME=$(printf "%05d" ${ITER})
	sudo cp "${f}" "${PICDIR}/${NAME}.jpg"
	((ITER++)) 
done
