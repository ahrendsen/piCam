#!/bin/sh

echo "IP: $(sudo hostname -I)\n" | mutt -s "Raspberry Pi IP Address" "$1"
