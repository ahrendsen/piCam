PICDIR=/home/karl/testDir/04

sudo avconv -f image2 -r 12 -i ${PICDIR}/%05d.jpg -vf scale=480:270 -b:v 1M -r:v 29.976 -c:v mpeg4 -qp 0 -preset veryslow -an "${PICDIR}/plantGrow.mp4"
