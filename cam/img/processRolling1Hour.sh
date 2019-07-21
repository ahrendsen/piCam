#!/bin/bash

echo "Renaming Files 1 hour"
time /home/pi/picam/cam/img/renameFilesRolling12Hours.sh 1

echo "Compiling Gif 1 hour"
time yes | /home/pi/picam/cam/img/compileFilesIntoGif.sh $HOME/PiPics/rolling1 rolling1.gif 5

echo "Uploading Gif 1 hour"
time /home/pi/picam/cam/img/uploadGif.sh rolling1.gif 

echo "Uploading Gif to ahrendsen.net"
scp -P 7822 /home/pi/AutoGif/rolling1.gif root@ahrendsen.net:/var/www/html/img
