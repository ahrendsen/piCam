# piCam

piCam is a collection of bash scripts that are used to operate webcams using a raspberry pi.

There are three aspects to this project: 1. Timelapse photos and 2. Motion detecting camera. and 3. Video monitor.

# Timelapse photos
This function involves collecting timelapse photos and concatenate them into a stop-motion film. 

For compiling timelapse photos into a video, you will need to install the following package for the program "avconv"
 - libav-tools

To compile the photos into a video, take the following steps. First run the "renameFiles.sh" script after editing the file to appropriately indicate where the pictures are stored and where you want them to be saved. Then, run the "compileFilesIntoVideo.sh" script, again, after editing to appropriately direct things. 

# Motion detecting camera
This function was intended to count the number of instances of motion in a very small region. I wanted to count the number of bubbles that went through an airlock in my brewing setup. I also hope to use it to capture images of lightning in the future. 

# Video monitor

Video monitoring is provided by dmxwebcam, not written or maintained by me. Visit https://github.com/AndrewFromMelbourne/dmxwebcam for more information on this project, including installation instructions.

Once installed, the dmxwebcam script should be put in this directory, and then you can view the webcam output with the command.

	./dmxwebcam
