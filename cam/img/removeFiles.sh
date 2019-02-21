#!/bin/bash

if [ $? -lt 1 ]; then 
	echo -e "No argument supplied, want to delete oldest day?\n"
	PICDIR=$( ls -1d ~/RbPics/*/* | head -n 1 )
	echo -e "This will remove the folder: $PICDIR\n\n"

	echo "Press enter to continue, CTRL-C to cancel."
	read
else
	PICDIR=$1
fi

rm $PICDIR/*.jpg
yes | sudo rm $PICDIR/renamed/*.jpg
rmdir $PICDIR/renamed
rmdir $PICDIR
