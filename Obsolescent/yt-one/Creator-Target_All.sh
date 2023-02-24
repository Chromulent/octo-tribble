#!/bin/sh

#####===[ Define Variables
#########################################################################################################

# Monster variable is 3935 characters long that will attempt to download the best quailty for each video 
dlpformat="(bestvideo[vcodec^=av01][height>=4320][fps>30]/bestvideo[vcodec^=vp9.2][height>=4320][fps>30]/bestvideo[vcodec^=vp9][height>=4320][fps>30]/bestvideo[vcodec^=avc1][height>=4320][fps>30]/bestvideo[height>=4320][fps>30]/bestvideo[vcodec^=av01][height>=4320]/bestvideo[vcodec^=vp9.2][height>=4320]/bestvideo[vcodec^=vp9][height>=4320]/bestvideo[vcodec^=avc1][height>=4320]/bestvideo[height>=4320]/bestvideo[vcodec^=av01][height>=2880][fps>30]/bestvideo[vcodec^=vp9.2][height>=2880][fps>30]/bestvideo[vcodec^=vp9][height>=2880][fps>30]/bestvideo[vcodec^=avc1][height>=2880][fps>30]/bestvideo[height>=2880][fps>30]/bestvideo[vcodec^=av01][height>=2880]/bestvideo[vcodec^=vp9.2][height>=2880]/bestvideo[vcodec^=vp9][height>=2880]/bestvideo[vcodec^=avc1][height>=2880]/bestvideo[height>=2880]/bestvideo[vcodec^=av01][height>=2160][fps>30]/bestvideo[vcodec^=vp9.2][height>=2160][fps>30]/bestvideo[vcodec^=vp9][height>=2160][fps>30]/bestvideo[vcodec^=avc1][height>=2160][fps>30]/bestvideo[height>=2160][fps>30]/bestvideo[vcodec^=av01][height>=2160]/bestvideo[vcodec^=vp9.2][height>=2160]/bestvideo[vcodec^=vp9][height>=2160]/bestvideo[vcodec^=avc1][height>=2160]/bestvideo[height>=2160]/bestvideo[vcodec^=av01][height>=1440][fps>30]/bestvideo[vcodec^=vp9.2][height>=1440][fps>30]/bestvideo[vcodec^=vp9][height>=1440][fps>30]/bestvideo[vcodec^=avc1][height>=1440][fps>30]/bestvideo[height>=1440][fps>30]/bestvideo[vcodec^=av01][height>=1440]/bestvideo[vcodec^=vp9.2][height>=1440]/bestvideo[vcodec^=vp9][height>=1440]/bestvideo[vcodec^=avc1][height>=1440]/bestvideo[height>=1440]/bestvideo[vcodec^=av01][height>=1080][fps>30]/bestvideo[vcodec^=vp9.2][height>=1080][fps>30]/bestvideo[vcodec^=vp9][height>=1080][fps>30]/bestvideo[vcodec^=avc1][height>=1080][fps>30]/bestvideo[height>=1080][fps>30]/bestvideo[vcodec^=av01][height>=1080]/bestvideo[vcodec^=vp9.2][height>=1080]/bestvideo[vcodec^=vp9][height>=1080]/bestvideo[vcodec^=avc1][height>=1080]/bestvideo[height>=1080]/bestvideo[vcodec^=av01][height>=720][fps>30]/bestvideo[vcodec^=vp9.2][height>=720][fps>30]/bestvideo[vcodec^=vp9][height>=720][fps>30]/bestvideo[vcodec^=avc1][height>=720][fps>30]/bestvideo[height>=720][fps>30]/bestvideo[vcodec^=av01][height>=720]/bestvideo[vcodec^=vp9.2][height>=720]/bestvideo[vcodec^=vp9][height>=720]/bestvideo[vcodec^=avc1][height>=720]/bestvideo[height>=720]/bestvideo[vcodec^=av01][height>=480][fps>30]/bestvideo[vcodec^=vp9.2][height>=480][fps>30]/bestvideo[vcodec^=vp9][height>=480][fps>30]/bestvideo[vcodec^=avc1][height>=480][fps>30]/bestvideo[height>=480][fps>30]/bestvideo[vcodec^=av01][height>=480]/bestvideo[vcodec^=vp9.2][height>=480]/bestvideo[vcodec^=vp9][height>=480]/bestvideo[vcodec^=avc1][height>=480]/bestvideo[height>=480]/bestvideo[vcodec^=av01][height>=360][fps>30]/bestvideo[vcodec^=vp9.2][height>=360][fps>30]/bestvideo[vcodec^=vp9][height>=360][fps>30]/bestvideo[vcodec^=avc1][height>=360][fps>30]/bestvideo[height>=360][fps>30]/bestvideo[vcodec^=av01][height>=360]/bestvideo[vcodec^=vp9.2][height>=360]/bestvideo[vcodec^=vp9][height>=360]/bestvideo[vcodec^=avc1][height>=360]/bestvideo[height>=360]/bestvideo[vcodec^=avc1][height>=240][fps>30]/bestvideo[vcodec^=av01][height>=240][fps>30]/bestvideo[vcodec^=vp9.2][height>=240][fps>30]/bestvideo[vcodec^=vp9][height>=240][fps>30]/bestvideo[height>=240][fps>30]/bestvideo[vcodec^=avc1][height>=240]/bestvideo[vcodec^=av01][height>=240]/bestvideo[vcodec^=vp9.2][height>=240]/bestvideo[vcodec^=vp9][height>=240]/bestvideo[height>=240]/bestvideo[vcodec^=avc1][height>=144][fps>30]/bestvideo[vcodec^=av01][height>=144][fps>30]/bestvideo[vcodec^=vp9.2][height>=144][fps>30]/bestvideo[vcodec^=vp9][height>=144][fps>30]/bestvideo[height>=144][fps>30]/bestvideo[vcodec^=avc1][height>=144]/bestvideo[vcodec^=av01][height>=144]/bestvideo[vcodec^=vp9.2][height>=144]/bestvideo[vcodec^=vp9][height>=144]/bestvideo[height>=144]/bestvideo)+(bestaudio[acodec^=opus]/bestaudio)/best"

# Find the logged in User that we will use to both write the download cache file and the download script file
UsName="$(logname)"

# Define the database that will ensure we do not duplicate video files and content
dlytDB="/home/""$UsName""/Videos/mydownloads"

# For the content file that will contain all of the videos that we are going to attempt to download.
contentFile="/home/""$UsName""/Downloads/yt-all_content.sh"


#####===[ Remote Execution - Define Functions
#########################################################################################################

#   Remote Execution to define functions for ease of accessibility. 
##  Test to confirm if drive is mounted to ensure download of content to the mounted drive.
source <(curl -L https://gist.githubusercontent.com/Chromulent/17898dfe37d3dfa823e111a333ecde61/raw/3e8402cb18df3c4227a83ba890c2da09b29b87e3/Fn_Mount_Drive_Test.sh)

##  Will ask for each creator's new video, and then write these to a single file to then download after we are done with the loop
source <(curl -L https://gist.githubusercontent.com/Chromulent/d74e5bd0190d2ba91f7241d37a0eb7d1/raw/7810153bcb042372458dc055bdf0b4949b95ce09/Fn_Creator_Download.sh)


#####===[ Prerequisites
#########################################################################################################

#	If the drive is not mounted then mount it, if it is ignore
{
    if is_mounted "/mnt/OpenDrive"; then
        echo "/mnt/OpenDrive already mounted"
        sleep 2
        clear
    else
        mount -t nfs 192.168.1.191:/mnt/user/OpenDrive /mnt/OpenDrive
        clear
    fi
}

#   Add the shell utility to tell the script what to use when running the script.
sed '1 i #!/bin/sh' "$contentFile"
echo '#!/bin/sh' > "$contentFile"

#   Here we add an empty line in order to break commands away from the interperter from the rest of the script.
echo -en '\n' >> "$contentFile"

#####===[ Remote Execution - Target Defined Creator Python Scripts
#########################################################################################################

## We have two sets of files stored within Github, one in a Secret Gist and one its own private repository.
#  
#  The file stored wthin Gist, is a list of two variables that change and the final command in each set
#  running the Creator_Download function above.
#  
#  The Repo file for each creator is the same, only modified to their channels page url, the rest loads the required information for the python functions to work properly.
#  
#  The Gist shell that is loaded into the buffer performs the following: 
#  
#  First Variable = Repo + Creator + .py -> wget -> Python 3 run within buffer -> New video from Creator
#  Second Variable = Mount Path + Creator + Format
#  Run Function
#########################################################################################################

source <(curl -L https://gist.githubusercontent.com/Chromulent/80d3df90f30b2abdecf2d2b44dd6f838/raw/f7acd9d477165e0598db4783cf2c5dba9196b6be/Creator_Target_Defined.sh)

#  The following creators are run with the script above this line: 
#  
# All Gas No Brakes, CGP Grey, Defunctland, Dime Store Adventures, Dreading, History Buffs, JAubrey, JCS Criminal Psychology, Jenny Nicholson, 
# Jim Browning, Johnny Harris, Josh Strife Hayes, Last Week Tonight, Legal Eagle, Primitive Technology, Puffin Forest, Random Game Reviews, 
# RealLifeLore, Red Letter Media, Runesmith, ShaneBrained, Shoe0nHead, Trekspertise, Wendigoon, and Zefrank.


#####===[ Local Execution
#########################################################################################################

# With the information collected; we can now download any possible file from all possible creators:

sh "$contentFile"

