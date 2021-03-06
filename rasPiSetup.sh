#git clone https://github.com/ahrendsen/picam
sudo apt-get install vim
sudo apt-get install emacs
sudo apt-get install git
sudo apt-get install ssmtp # For email sending (not sure if I need both mutt and ssmtp)
sudo apt-get install mutt # For email sending
sudo apt-get install sendmail # For... also sending mail? (found errors in log 
                              # file that a program was trying to run this 
                              # program.)
sudo apt-get install gpgsm # For ???
sudo apt-get install libav-tools # For video compilation (avconv)
sudo apt-get install ffmpeg # For gif compilation (ffmpeg)
sudo apt-get install fswebcam # For automated picture taking
sudo apt-get install rclone # For automatic picture uploading to cloud storage.

touch /home/pi/.startCount
git clone https://github.com/andrewfrommelbourne/dmxwebcam
sudo apt-get install libbsd-dev
mkdir build
cd build/
sudo apt-get install cmake
cmake ..
##git clone https://github.com/ahrendsen/RbControl

git clone git://git.drogon.net/wiringPi
cd wiringPi/
./build 

sudo raspi-config
### In raspi-config
#
#	In localization
#		In Locale
#			UTF-8
#		In Keyboard layout
#			Change the keyboard layout (104 key US keyboard)
#	In Interfacing
#		Change SPI to YES
#		Change SSH to YES
#
###

git config --global user.email "karl.ahrendsen@gmail.com"
git config --global user.name "Karl Ahrendsen"

### Add the following to the .profile.
#
#	export EDITOR=/usr/bin/vim
#
### So that the default editor will be vim instead of nano.

### Enable sending email on your device. Create a file called ".muttrc"
#   In the home directory and put in the following contents.
#
#  #About Me
#  set from = "rubidium.pi@gmail.com"
#  set realname = "Karl Ahrendsen"
#  
#  # My credentials
#  set smtp_url = "smtp://rubidium.pi@gmail.com@smtp.gmail.com:587/"
#  set smtp_pass = "yourPassword"
#
### You'll probably also want to copy this file to root's home directory

### Setup the system to email you its IP when it starts up if its connected
#   to a network. 
#
#  Edit the file /etc/rc.local to include a reference to 
#  the emailIP.sh script located in the base directory.
###
