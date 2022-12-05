#!/bin/sh

#################################################################
# New Script
#################################################################


#####===[ Define Variables
#########################################################################################################

# Monster variable is 3935 characters long that will attempt to download the best quailty for each video 
dlpformat="(bestvideo[vcodec^=av01][height>=4320][fps>30]/bestvideo[vcodec^=vp9.2][height>=4320][fps>30]/bestvideo[vcodec^=vp9][height>=4320][fps>30]/bestvideo[vcodec^=avc1][height>=4320][fps>30]/bestvideo[height>=4320][fps>30]/bestvideo[vcodec^=av01][height>=4320]/bestvideo[vcodec^=vp9.2][height>=4320]/bestvideo[vcodec^=vp9][height>=4320]/bestvideo[vcodec^=avc1][height>=4320]/bestvideo[height>=4320]/bestvideo[vcodec^=av01][height>=2880][fps>30]/bestvideo[vcodec^=vp9.2][height>=2880][fps>30]/bestvideo[vcodec^=vp9][height>=2880][fps>30]/bestvideo[vcodec^=avc1][height>=2880][fps>30]/bestvideo[height>=2880][fps>30]/bestvideo[vcodec^=av01][height>=2880]/bestvideo[vcodec^=vp9.2][height>=2880]/bestvideo[vcodec^=vp9][height>=2880]/bestvideo[vcodec^=avc1][height>=2880]/bestvideo[height>=2880]/bestvideo[vcodec^=av01][height>=2160][fps>30]/bestvideo[vcodec^=vp9.2][height>=2160][fps>30]/bestvideo[vcodec^=vp9][height>=2160][fps>30]/bestvideo[vcodec^=avc1][height>=2160][fps>30]/bestvideo[height>=2160][fps>30]/bestvideo[vcodec^=av01][height>=2160]/bestvideo[vcodec^=vp9.2][height>=2160]/bestvideo[vcodec^=vp9][height>=2160]/bestvideo[vcodec^=avc1][height>=2160]/bestvideo[height>=2160]/bestvideo[vcodec^=av01][height>=1440][fps>30]/bestvideo[vcodec^=vp9.2][height>=1440][fps>30]/bestvideo[vcodec^=vp9][height>=1440][fps>30]/bestvideo[vcodec^=avc1][height>=1440][fps>30]/bestvideo[height>=1440][fps>30]/bestvideo[vcodec^=av01][height>=1440]/bestvideo[vcodec^=vp9.2][height>=1440]/bestvideo[vcodec^=vp9][height>=1440]/bestvideo[vcodec^=avc1][height>=1440]/bestvideo[height>=1440]/bestvideo[vcodec^=av01][height>=1080][fps>30]/bestvideo[vcodec^=vp9.2][height>=1080][fps>30]/bestvideo[vcodec^=vp9][height>=1080][fps>30]/bestvideo[vcodec^=avc1][height>=1080][fps>30]/bestvideo[height>=1080][fps>30]/bestvideo[vcodec^=av01][height>=1080]/bestvideo[vcodec^=vp9.2][height>=1080]/bestvideo[vcodec^=vp9][height>=1080]/bestvideo[vcodec^=avc1][height>=1080]/bestvideo[height>=1080]/bestvideo[vcodec^=av01][height>=720][fps>30]/bestvideo[vcodec^=vp9.2][height>=720][fps>30]/bestvideo[vcodec^=vp9][height>=720][fps>30]/bestvideo[vcodec^=avc1][height>=720][fps>30]/bestvideo[height>=720][fps>30]/bestvideo[vcodec^=av01][height>=720]/bestvideo[vcodec^=vp9.2][height>=720]/bestvideo[vcodec^=vp9][height>=720]/bestvideo[vcodec^=avc1][height>=720]/bestvideo[height>=720]/bestvideo[vcodec^=av01][height>=480][fps>30]/bestvideo[vcodec^=vp9.2][height>=480][fps>30]/bestvideo[vcodec^=vp9][height>=480][fps>30]/bestvideo[vcodec^=avc1][height>=480][fps>30]/bestvideo[height>=480][fps>30]/bestvideo[vcodec^=av01][height>=480]/bestvideo[vcodec^=vp9.2][height>=480]/bestvideo[vcodec^=vp9][height>=480]/bestvideo[vcodec^=avc1][height>=480]/bestvideo[height>=480]/bestvideo[vcodec^=av01][height>=360][fps>30]/bestvideo[vcodec^=vp9.2][height>=360][fps>30]/bestvideo[vcodec^=vp9][height>=360][fps>30]/bestvideo[vcodec^=avc1][height>=360][fps>30]/bestvideo[height>=360][fps>30]/bestvideo[vcodec^=av01][height>=360]/bestvideo[vcodec^=vp9.2][height>=360]/bestvideo[vcodec^=vp9][height>=360]/bestvideo[vcodec^=avc1][height>=360]/bestvideo[height>=360]/bestvideo[vcodec^=avc1][height>=240][fps>30]/bestvideo[vcodec^=av01][height>=240][fps>30]/bestvideo[vcodec^=vp9.2][height>=240][fps>30]/bestvideo[vcodec^=vp9][height>=240][fps>30]/bestvideo[height>=240][fps>30]/bestvideo[vcodec^=avc1][height>=240]/bestvideo[vcodec^=av01][height>=240]/bestvideo[vcodec^=vp9.2][height>=240]/bestvideo[vcodec^=vp9][height>=240]/bestvideo[height>=240]/bestvideo[vcodec^=avc1][height>=144][fps>30]/bestvideo[vcodec^=av01][height>=144][fps>30]/bestvideo[vcodec^=vp9.2][height>=144][fps>30]/bestvideo[vcodec^=vp9][height>=144][fps>30]/bestvideo[height>=144][fps>30]/bestvideo[vcodec^=avc1][height>=144]/bestvideo[vcodec^=av01][height>=144]/bestvideo[vcodec^=vp9.2][height>=144]/bestvideo[vcodec^=vp9][height>=144]/bestvideo[height>=144]/bestvideo)+(bestaudio[acodec^=opus]/bestaudio)/best"

# Define the database that will ensure we do not duplicate video files and content
dlytDB="/home/blackwood/MEGAsync/Z·93 - IXM-AV171-00/U·19 - Umbel/content/yt/.mydownloads"

# For the content file that will contain all of the videos that we are going to attempt to download.
contentFile="/home/blackwood/Downloads/yt-all_content.sh"


#####===[ Remote Execution - Define Functions
#########################################################################################################

#   Remote Execution to define functions for ease of accessibility. 
##  Test to confirm if drive is mounted to ensure download of content to the mounted drive.
source <(curl -L https://gist.githubusercontent.com/Chromulent/17898dfe37d3dfa823e111a333ecde61/raw/3e8402cb18df3c4227a83ba890c2da09b29b87e3/Fn_Mount_Drive_Test.sh)
##  Add the WhipTail function; which will let us ask for each creator; if we want their new video based on its title.
source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/main/Automation/Functions/Yes_or_No_Whiptail.sh)


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
sed '1 i #!/bin/sh' /home/blackwood/Downloads/yt-all_content.sh
echo '#!/bin/sh' > /home/blackwood/Downloads/yt-all_content.sh

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

#  The following creators are run with the script above this line: 
# 
# Kings and Generals, Kitboga, Kurzgesagt, Linus Tech Tips, Lock Picking Lawyer, 
# Lockstein and Gnogginm Official Nerd Cubed, PsyscoTrip, and RamZaes.

source <(curl -L https://gist.githubusercontent.com/Chromulent/0480df7748fce5123c9155ee4db63ef7/raw/1014eb68474801cc58b221c5bfe0cb9f2374e7cd/Creator_Target_Defined_K-R.sh)


#####===[ Local Execution
#########################################################################################################

# With the information collected; we can now download any possible file from all possible creators:

sh "$contentFile"







#################################################################
# Old Script
#################################################################




# First we use this 3935 character long variable that will attempt to download the best video for each kind of video
dlpformat="(bestvideo[vcodec^=av01][height>=4320][fps>30]/bestvideo[vcodec^=vp9.2][height>=4320][fps>30]/bestvideo[vcodec^=vp9][height>=4320][fps>30]/bestvideo[vcodec^=avc1][height>=4320][fps>30]/bestvideo[height>=4320][fps>30]/bestvideo[vcodec^=av01][height>=4320]/bestvideo[vcodec^=vp9.2][height>=4320]/bestvideo[vcodec^=vp9][height>=4320]/bestvideo[vcodec^=avc1][height>=4320]/bestvideo[height>=4320]/bestvideo[vcodec^=av01][height>=2880][fps>30]/bestvideo[vcodec^=vp9.2][height>=2880][fps>30]/bestvideo[vcodec^=vp9][height>=2880][fps>30]/bestvideo[vcodec^=avc1][height>=2880][fps>30]/bestvideo[height>=2880][fps>30]/bestvideo[vcodec^=av01][height>=2880]/bestvideo[vcodec^=vp9.2][height>=2880]/bestvideo[vcodec^=vp9][height>=2880]/bestvideo[vcodec^=avc1][height>=2880]/bestvideo[height>=2880]/bestvideo[vcodec^=av01][height>=2160][fps>30]/bestvideo[vcodec^=vp9.2][height>=2160][fps>30]/bestvideo[vcodec^=vp9][height>=2160][fps>30]/bestvideo[vcodec^=avc1][height>=2160][fps>30]/bestvideo[height>=2160][fps>30]/bestvideo[vcodec^=av01][height>=2160]/bestvideo[vcodec^=vp9.2][height>=2160]/bestvideo[vcodec^=vp9][height>=2160]/bestvideo[vcodec^=avc1][height>=2160]/bestvideo[height>=2160]/bestvideo[vcodec^=av01][height>=1440][fps>30]/bestvideo[vcodec^=vp9.2][height>=1440][fps>30]/bestvideo[vcodec^=vp9][height>=1440][fps>30]/bestvideo[vcodec^=avc1][height>=1440][fps>30]/bestvideo[height>=1440][fps>30]/bestvideo[vcodec^=av01][height>=1440]/bestvideo[vcodec^=vp9.2][height>=1440]/bestvideo[vcodec^=vp9][height>=1440]/bestvideo[vcodec^=avc1][height>=1440]/bestvideo[height>=1440]/bestvideo[vcodec^=av01][height>=1080][fps>30]/bestvideo[vcodec^=vp9.2][height>=1080][fps>30]/bestvideo[vcodec^=vp9][height>=1080][fps>30]/bestvideo[vcodec^=avc1][height>=1080][fps>30]/bestvideo[height>=1080][fps>30]/bestvideo[vcodec^=av01][height>=1080]/bestvideo[vcodec^=vp9.2][height>=1080]/bestvideo[vcodec^=vp9][height>=1080]/bestvideo[vcodec^=avc1][height>=1080]/bestvideo[height>=1080]/bestvideo[vcodec^=av01][height>=720][fps>30]/bestvideo[vcodec^=vp9.2][height>=720][fps>30]/bestvideo[vcodec^=vp9][height>=720][fps>30]/bestvideo[vcodec^=avc1][height>=720][fps>30]/bestvideo[height>=720][fps>30]/bestvideo[vcodec^=av01][height>=720]/bestvideo[vcodec^=vp9.2][height>=720]/bestvideo[vcodec^=vp9][height>=720]/bestvideo[vcodec^=avc1][height>=720]/bestvideo[height>=720]/bestvideo[vcodec^=av01][height>=480][fps>30]/bestvideo[vcodec^=vp9.2][height>=480][fps>30]/bestvideo[vcodec^=vp9][height>=480][fps>30]/bestvideo[vcodec^=avc1][height>=480][fps>30]/bestvideo[height>=480][fps>30]/bestvideo[vcodec^=av01][height>=480]/bestvideo[vcodec^=vp9.2][height>=480]/bestvideo[vcodec^=vp9][height>=480]/bestvideo[vcodec^=avc1][height>=480]/bestvideo[height>=480]/bestvideo[vcodec^=av01][height>=360][fps>30]/bestvideo[vcodec^=vp9.2][height>=360][fps>30]/bestvideo[vcodec^=vp9][height>=360][fps>30]/bestvideo[vcodec^=avc1][height>=360][fps>30]/bestvideo[height>=360][fps>30]/bestvideo[vcodec^=av01][height>=360]/bestvideo[vcodec^=vp9.2][height>=360]/bestvideo[vcodec^=vp9][height>=360]/bestvideo[vcodec^=avc1][height>=360]/bestvideo[height>=360]/bestvideo[vcodec^=avc1][height>=240][fps>30]/bestvideo[vcodec^=av01][height>=240][fps>30]/bestvideo[vcodec^=vp9.2][height>=240][fps>30]/bestvideo[vcodec^=vp9][height>=240][fps>30]/bestvideo[height>=240][fps>30]/bestvideo[vcodec^=avc1][height>=240]/bestvideo[vcodec^=av01][height>=240]/bestvideo[vcodec^=vp9.2][height>=240]/bestvideo[vcodec^=vp9][height>=240]/bestvideo[height>=240]/bestvideo[vcodec^=avc1][height>=144][fps>30]/bestvideo[vcodec^=av01][height>=144][fps>30]/bestvideo[vcodec^=vp9.2][height>=144][fps>30]/bestvideo[vcodec^=vp9][height>=144][fps>30]/bestvideo[height>=144][fps>30]/bestvideo[vcodec^=avc1][height>=144]/bestvideo[vcodec^=av01][height>=144]/bestvideo[vcodec^=vp9.2][height>=144]/bestvideo[vcodec^=vp9][height>=144]/bestvideo[height>=144]/bestvideo)+(bestaudio[acodec^=opus]/bestaudio)/best"

# Second we set a function that we will ask for each creator's new video, and then write these to a single file to then download after we are done for each creator.
yes_no_whiptail () {
       if whiptail --yesno "${subname} has uploaded a new video entitled: ${title}, do you want to download this?" 20 60 ;then
         echo yt-dlp --format "'$dlpformat'" --verbose --force-ipv4 --sleep-requests 1 --sleep-interval 5 --max-sleep-interval 30 --ignore-errors --no-continue --no-overwrites --download-archive '/home/blackwood/MEGAsync/U·19 - Umbel/content/yt/.mydownloads' --check-formats --concurrent-fragments 5  -o "'$subdirout'" --restrict-filenames  --throttled-rate 100K "'$videoVar'"  >> "$contentFile"
      else
         echo No
       fi
}



# Next we set the variable for the content file that will contain all of the videos that we are going to attempt to download.
contentFile="/home/blackwood/Downloads/yt-target_content.sh"

# Purge conents of previously downloaded files
cat /dev/null > "$contentFile"

# Add the shell utility to tell the script what to use when running the script.
sed '1 i #!/bin/sh' /home/blackwood/Downloads/yt-target_content.sh || echo '#!/bin/sh' > /home/blackwood/Downloads/yt-target_content.sh
# Here we add an empty line in order to break commands away from the interperter from the rest of the script.
echo -en '\n' >> "$contentFile"


# These are subscribers that I want only specific content for. Anything beyond that I do not want.
# This section should -- should parse each subscribers new content. 
#########################################################################################################


clear
subname="Kings and Generals"
videoVar=$(python3 '/home/blackwood/MEGAsync/Z·93 - IXM-AV171-00/U·19 - Umbel/dae38/Automation/subscriber/yt-Kings_and_Generals.py')
title="$(youtube-dl --get-title "$videoVar")"
subdirout='/mnt/OpenDrive/Videos/Creators/Kings and Generals/%(title)s.%(ext)s'
yes_no_whiptail

clear
subname="Kitboga"
videoVar=$(python3 '/home/blackwood/MEGAsync/Z·93 - IXM-AV171-00/U·19 - Umbel/dae38/Automation/subscriber/yt-Kitboga.py')
title="$(youtube-dl --get-title "$videoVar")"
subdirout='/mnt/OpenDrive/Videos/Creators/Kitboga/%(title)s.%(ext)s'
yes_no_whiptail

clear
subname="Kurzgesagt"
videoVar=$(python3 '/home/blackwood/MEGAsync/Z·93 - IXM-AV171-00/U·19 - Umbel/dae38/Automation/subscriber/yt-Kurzgesagt.py')
title="$(youtube-dl --get-title "$videoVar")"
subdirout='/mnt/OpenDrive/Videos/Creators/Kurzgesagt/%(title)s.%(ext)s'
yes_no_whiptail

clear
subname="Linus Tech Tips"
videoVar=$(python3 '/home/blackwood/MEGAsync/Z·93 - IXM-AV171-00/U·19 - Umbel/dae38/Automation/subscriber/yt-Linus_Tech_Tips.py')
title="$(youtube-dl --get-title "$videoVar")"
subdirout='/mnt/OpenDrive/Videos/Creators/Linus Tech Tips/%(title)s.%(ext)s'
yes_no_whiptail


clear
subname="Lock Picking Lawyer"
videoVar=$(python3 '/home/blackwood/MEGAsync/Z·93 - IXM-AV171-00/U·19 - Umbel/dae38/Automation/subscriber/yt-LockPickingLawyer.py')
title="$(youtube-dl --get-title "$videoVar")"
subdirout='/mnt/OpenDrive/Videos/Creators/LockPickingLawyer/%(title)s.%(ext)s'
yes_no_whiptail


clear
subname="Lockstin and Gnoggin"
videoVar=$(python3 '/home/blackwood/MEGAsync/Z·93 - IXM-AV171-00/U·19 - Umbel/dae38/Automation/subscriber/yt-Lockstin_and_Gnoggin.py')
title="$(youtube-dl --get-title "$videoVar")"
subdirout='/mnt/OpenDrive/Videos/Creators/Lockstin and Gnoggin/%(title)s.%(ext)s'
yes_no_whiptail

clear
subname="Official Nerd Cubed"
videoVar=$(python3 '/home/blackwood/MEGAsync/Z·93 - IXM-AV171-00/U·19 - Umbel/dae38/Automation/subscriber/yt-OfficialNerdCubed.py')
title="$(youtube-dl --get-title "$videoVar")"
subdirout='/mnt/OpenDrive/Videos/Creators/OfficialNerdCubed/%(title)s.%(ext)s'
yes_no_whiptail

clear
subname="Psychotrip"
videoVar=$(python3 '/home/blackwood/MEGAsync/Z·93 - IXM-AV171-00/U·19 - Umbel/dae38/Automation/subscriber/yt-psychotrip.py')
title="$(youtube-dl --get-title "$videoVar")"
subdirout='/mnt/OpenDrive/Videos/Creators/psychotrip/%(title)s.%(ext)s'
yes_no_whiptail

clear
subname="RamZaes"
videoVar=$(python3 '/home/blackwood/MEGAsync/Z·93 - IXM-AV171-00/U·19 - Umbel/dae38/Automation/subscriber/yt-RamZaes.py')
title="$(youtube-dl --get-title "$videoVar")"
subdirout='/mnt/OpenDrive/Videos/Creators/RamZaes/%(title)s.%(ext)s'
yes_no_whiptail


#########################################################################################################

sh "$contentFile"

#########################################################################################################


clear

cd '/mnt/OpenDrive/Videos/Creators/'


bash '/home/blackwood/MEGAsync/Z·93 - IXM-AV171-00/U·19 - Umbel/dae38/Automation/yt-cleanup.sh'



#########################################################################################################

