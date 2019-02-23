#!/bin/bash

echo "Renaming Files"
/home/pi/picam/cam/img/renameFilesRolling12Hours.sh
echo "Compiling Gif"
yes | /home/pi/picam/cam/img/compileDirectoryIntoGif.sh rolling12 rolling.gif
echo "Uploading Gif"
/home/pi/picam/cam/img/uploadGif.sh rolling12.gif 

echo "Uploading Gif to ahrendsen.net"
scp -P 7822 /home/pi/AutoGif/rolling.gif root@ahrendsen.net:/var/www/html/img
