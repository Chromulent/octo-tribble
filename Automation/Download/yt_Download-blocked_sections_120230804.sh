#!/bin/sh

## Attempt to reconstruct and shrink files and remove complexity by adding integration 
## This file will be constructed as the broken down version, but each section that could cause confusion reduced to a file to download and load the variable / array / contents.

#####===[ Define Variables
#########################################################################################################

# Monster variable is 3935 characters long that will attempt to download the best quailty for each video 
	source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/main/Automation/Download/Underactive%20Functions/yt_Download-Section-01.sh)

# Find the logged in User that we will use to both write the download cache file and the download script file
	UsName="$(logname)" # Default

# Define the database that will ensure we do not duplicate video files and content
	dlytDB="/home/""$UsName""/Videos/mydownloads" # Default

# For the content file that will contain all of the videos that we are going to attempt to download.
    contentFile="/home/""$UsName""/Downloads/yt-all_content.sh"

#  Prefix for the Channel ID of each Creator within the Creator Video Array.
    ytChantem="https://www.youtube.com/channel/"

#  Prefix for the video url that will be appended to every video id that we will parse from each Creator.
    ytWatch="https://www.youtube.com/watch?v="

#  Prefix for parsing the Creators Channel to get the 9 most recent videos from the channel.
    ytXml="https://www.youtube.com/feeds/videos.xml?channel_id="


#####===[ Prerequisites
#########################################################################################################

##  Script file where we download videos
#   Alter the script to remove past content
#   Add the shell utility to tell the script what to use when running the script.
#   Here we add an empty line in order to break commands away from the interperter from the rest of the script.

    source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/main/Automation/Download/Underactive%20Functions/yt_Download-Section-02.sh)


#####===[ Local Execution - Define Functions and Arrays
#########################################################################################################

#   Creator Video Array
source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/main/Automation/Download/Underactive%20Functions/yt_Download_section-03.sh)

#   Write Function that we will use to write content to the contentfile to download videos.
Creator_Download () {
    echo yt-dlp --format "'$dlpformat'" --verbose --force-ipv4 --sleep-requests 1 --sleep-interval 5 --max-sleep-interval 30 --ignore-errors --no-continue --no-overwrites --check-formats --concurrent-fragments 5 "$exFilter" -o "'$subdirout'" --restrict-filenames  --embed-metadata --write-thumbnail  --throttled-rate 100K "'$videoVar'"  >> "$contentFile"
    echo -en '\n' >> "$contentFile"
}


#####===[ Local Execution
#########################################################################################################

##   Create the function that will attempt to iterate through each indicie -- this is in an attempt to resolve a needing to download this function for each creator.
#  For each Creator Channel ID within the Creator Video Array.
#  Create new variable that allows us to collect the Channel ID.
#  Create new variable that adds the XML variable to the Channel ID.
#  Create new variable that adds the Channel ID to its correlated Channel URL.
#  Create array by parsing the XML variables to grab all of the titles of all recent videos.
#  Create another array that will allow us to modify work within.
#  Grab the length of the array - titleIDs
#  Create array by parsing the XML variables to grab all of the videos IDs of all recent videos.
#  Create another array that will allow us to modify work within.
#  Grab the length of the array - videoIDs
#  The first item on the titleIDs array contains the Creator name that we will use.
#  If the Creators name has an ampersand within its name, this breaks the script, so this is to account for that.
#  Case allows us to to create a default set of variables so that in the next section we can run through any possible creator that we have on this list.
#  This is a nested function that is called on when the script is run.
#  Set this into motion
#  Call the Created_Download function to run its course and store each set of videos inside of our content file. 

source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/main/Automation/Download/Underactive%20Functions/yt_Download_section-04.sh)


#####===[ Begin Downloading with local execution
#########################################################################################################

sh "$contentFile"


#####===[ Information for further script execution
#########################################################################################################

## REGEX filter - Titles
# ; exFilter_prefix=' --match-filter "title ~= (?i)"' ; filterVarible="REGEX" ; exFilter_suffix='" ' ; exFilter="${exFilter_prefix}${filterVarible}${exFilter_suffix}"

## REGEX filter - Description
# ; exFilter_prefix=' --match-filter "description ~= (?i)"' ; filterVarible="REGEX" ; exFilter_suffix='" ' ; exFilter="${exFilter_prefix}${filterVarible}${exFilter_suffix}"

## REGEX filter - Duration
# ; exFilter_prefix=' --match-filter "description ~= (?i)"' ; filterVarible="REGEX" ; exFilter_suffix='" ' ; exFilter="${exFilter_prefix}${filterVarible}${exFilter_suffix}"

## Multiple filters for duration within a single forced variable
# exFilter=' --match-filter="duration<150" --match-filter "duration>360" '

## Multiple filters within a single forced variable
# exFilter=' --match-filter "title ~= (?i)Fallout" --match-filter "description!~='#fallout'" --match-filter "description!~='#Fallout'" '


## Do not download LIVE videos of any kind
# ; exFilter_prefix=' --match-filter "' ; filterVarible='!is_live & !live' ; exFilter_suffix='" ' ; exFilter="${exFilter_prefix}${filterVarible}${exFilter_suffix}"


