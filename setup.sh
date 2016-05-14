#!/bin/bash

# Setup the static IP Address of the raspberryPi
# Make sure to configure the interfaces file in
# configurationFiles first.
sudo cp /etc/network/interfaces /etc/network/interfaces.bak
sudo cp configurationFiles/interfaces /etc/network/interfaces

# Install the programs for the nfs server
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install git vim nfs-kernel-server nfs-common 

# Put in the configuration file for the remote file system.
# Make sure to edit fstab before running!
sudo cp /etc/fstab /etc/fstab.bak
sudo cp configurationFiles/fstab /etc/fstab

# Install programs for taking pictures
sudo apt-get install motion fswebcam

# Install the crontab to automatically take pictures
#
#	*** Don't forget to edit the crontab to 
# 	Reflect the location of your takeImage.sh
#
sudo crontab configurationFiles/crontab

