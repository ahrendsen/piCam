#!/bin/sh

echo "IP: $(sudo hostname -I)\n" | sudo mutt -s "IR Raspi" "$1 $2"
