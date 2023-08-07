#!/bin/sh

#####===[ Local Execution
#########################################################################################################

#   Create the function that will attempt to iterate through each indicie -- this is in an attempt to resolve a needing to download this function for each creator.
    source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/main/Automation/Download/Underactive%20Functions/yt_Download_section-05.sh)

#  For each Creator Channel ID within the Creator Video Array.
for VidChan in "${vidArray[@]}"; do

#  Create new variable that allows us to collect the Channel ID.
    channelID="$(echo "${VidChan}")"

#  Create new variable that adds the XML variable to the Channel ID.
    channelXMl="${ytXml}${channelID}"

#  Create new variable that adds the Channel ID to its correlated Channel URL.
    channelID="${ytChantem}${channelID}"

#  Create array by parsing the XML variables to grab all of the titles of all recent videos.
    titles_set="$( curl -s "$channelXMl" | grep -E "<title>" | sed -e 's/<[^>]*>//g' )"
#  Create another array that will allow us to modify work within.
    readarray -t titleIDs <<<"$titles_set"

#  Grab the length of the array - titleIDs
    ti="$( echo "${#titleIDs[@]}" )"	

#  Create array by parsing the XML variables to grab all of the videos IDs of all recent videos.
    videoID_set="$( curl -s "$channelXMl" | grep -E "<yt:videoId>" | sed -e 's/<[^>]*>//g' )"
#  Create another array that will allow us to modify work within.
    readarray -t videoIDs <<<"$videoID_set"

#  Grab the length of the array - videoIDs
    vi="$( echo "${#videoIDs[@]}" )"	

#  The first item on the titleIDs array contains the Creator name that we will use.
    ChannelName="$( echo "${titleIDs[0]}" | sed 's/^ *//g' )"
#  If the Creators name has an ampersand within its name, this breaks the script, so this is to account for that.
    if [[ "$ChannelName" == *"&amp"* ]] ; then ChannelName="$( echo "${ChannelName}" | sed 's/&amp;/and/g'  )"; fi
    if [[ "$ChannelName" == *"& amp"* ]]; then ChannelName="$( echo "${ChannelName}" | sed 's/& amp;/and/g' )"; fi

#  Case allows us to to create a default set of variables so that in the next section we can run through any possible creator that we have on this list.
#  This is loaded in above before the loop for each creator and nested within a function.
    Case_Function

#  Set this into motion
	videoVar="$(echo "${channelID}")"

	Creator_Download
    echo "Collecting channel: ${ChannelName}"

done

