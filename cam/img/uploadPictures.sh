#Get the month to help separate all of the photos into dirs.
MONTH=$(date +"%m")
#Get the day of the month to help separate all of the photos into dirs.
DAY=$(date +"%d")
DATEFOLDERS=${MONTH}/${DAY}
BASEDIR=$HOME/PiPics
MOTIONDIR=$HOME/motionPics
rclone sync $BASEDIR/$DATEFOLDERS unlbox:piCamPics/$DATEFOLDERS
rclone sync $MOTIONDIR/$DATEFOLDERS unlbox:piCamPics/motion/$DATEFOLDERS
