sudo apt-get install vim
sudo apt-get install emacs
sudo apt-get install git
sudo apt-get install mutt
git clone https://github.com/ahrendsen/picam
sudo apt-get install fswebcam
touch /home/pi/.startCount
git clone https://github.com/andrewfrommelbourne/dmxwebcam
sudo apt-get install libbsd-dev
mkdir build
cd build/
sudo apt-get install cmake
cmake ..
git clone https://github.com/ahrendsen/RbControl
sudo apt-get install wiringPi
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
#		Chage SSH to YES
#
###
export EDITOR=/usr/bin/vim
git config --global user.email "karl.ahrendsen@gmail.com"
git config --global user.name "Karl Ahrendsen"

### Add the following to the .profile.
#
#	export EDITOR /usr/bin/vim
#
### So that the default editor will be vim instead of nano.
