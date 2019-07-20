#!/bin/bash

echo "Renaming Files 12 hour"
time /home/pi/picam/cam/img/renameFilesRolling12Hours.sh

echo "Compiling Gif 12 hour"
time yes | /home/pi/picam/cam/img/compileFilesIntoGif.sh $HOME/PiPics/rolling12 rolling12.gif 

echo "Uploading Gif 12 hour"
time /home/pi/picam/cam/img/uploadGif.sh rolling12.gif 

echo "Uploading Gif to ahrendsen.net"
scp -P 7822 /home/pi/AutoGif/rolling12.gif root@ahrendsen.net:/var/www/html/img
