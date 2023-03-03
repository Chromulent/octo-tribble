#!/bin/sh

# Get the array that has all of the creators content that we can call.
source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/main/subscribers/Defined/channel_array.sh)



for file in $(ls)
do
Extension=${file##*.}
case "$Extension" in
  sh) echo "Shell script: $file";;
  md) echo "A markdown file: $file";;
  png) echo "PNG image file: $file";;
  txt) echo "A text file: $file";;
  zip) echo "An archive: $file";;
  conf) echo "A configuration file: $file";;
  py) echo "A Python script: $file";;
  *) echo "Unknown file type: $file";;
esac
done













# This is important to note that this method will only get the 9 most recent videos from the creator -- which will be useful in parsing data



### Live Testing ### 


ytChantem="https://www.youtube.com/channel/"
ytWatch="https://www.youtube.com/watch?v="

# Just a test to loop through the incidices of the video IDs
for VidChan in "${vidArray[@]}"; do

channelID="$(echo "${VidChan}")"
channelID="${ytChantem}${channelID}"



videoID_set="$( curl -s https://www.youtube.com/feeds/videos.xml?channel_id="$channelID" | grep -E "<yt:videoId>" | sed -e 's/<[^>]*>//g' )"

readarray -t videoIDs <<<"$videoID_set"


done




titles_set="$( curl -s https://www.youtube.com/feeds/videos.xml?channel_id="$channelID" | grep -E "<title>" | sed -e 's/<[^>]*>//g' )"



readarray -t titleIDs <<<"$titles_set"




 



### Cached confirmed working Testing only ###

ytChantem="https://www.youtube.com/channel/"

# Just a test to loop through the incidices of the video IDs
for VidChan in "${vidArray[@]}"; do

ChannelName="$(echo "${VidChan}")"
ChannelName="${ytChantem}${ChannelName}"

echo "$ChannelName"

done



channelID="UC-AQKm7HUNMmxjdS371MSwg"

titles_set="$( curl -s https://www.youtube.com/feeds/videos.xml?channel_id="$channelID" | grep -E "<title>" | sed -e 's/<[^>]*>//g' )"

videoID_set="$( curl -s https://www.youtube.com/feeds/videos.xml?channel_id="$channelID" | grep -E "<yt:videoId>" | sed -e 's/<[^>]*>//g' )"


readarray -t titleIDs <<<"$titles_set"

readarray -t videoIDs <<<"$videoID_set"

