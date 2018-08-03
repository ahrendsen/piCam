# piCam

piCam is a collection of bash scripts that are used to operate webcams using a raspberry pi.

There are two aspects to this project: 1. Timelapse photos and 2. Motion detecting camera.

# Timelapse photos
This function involves collecting timelapse photos and concatenate them into a stop-motion film. 

For compiling timelapse photos into a video, you will need to install the following package for the program "avconv"
	libav-tools

To compile the photos into a video, take the following steps. First run the "renameFiles.sh" script after editing the file to appropriately indicate where the pictures are stored and where you want them to be saved. Then, run the "compileFilesIntoVideo.sh" script, again, after editing to appropriately direct things. 

# Motion detecting camera
This function was intended to count the number of instances of motion in a very small region. I wanted to count the number of bubbles that went through an airlock in my brewing setup. I also hope to use it to capture images of lightning in the future. 
