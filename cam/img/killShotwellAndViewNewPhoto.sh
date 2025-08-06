#!/bin/bash
pkill -f shotwell
FILE=$( ls ~/autoPic/*.CR2 | tail -n 1 )
shotwell $FILE &
echo $FILE
