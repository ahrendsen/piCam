# Get the names of the cameras.
gphoto2 --auto-detect | grep [[:alnum:][[:space:]]*[[:space:]]\([[:alnum:\]]*[[:space:]][[:alnum:]]*\) -o > cameraList.txt
IFS=$'\n'
cameras=($(cat cameraList.txt | sed s'#"##'g))
declare -p cameras
for i in $cameras; do 
echo $cameras;
done

# Get the IDs of the cameras.
usbIds=($(gphoto2 --auto-detect | grep usb:[[:digit:]]*,[[:digit:]]* -o))
echo $usbIds

# Get the number of cameras.
cameraNumber=$(gphoto2 --auto-detect | grep usb:[[:digit:]]*,[[:digit:]]* -o -c)

for i in $(seq $((cameraNumber-1)) -1 0); do
	gphoto2 --camera='${cameras[$i]}' --port=${usbIds[$i]} --capture-image-and-download
done
