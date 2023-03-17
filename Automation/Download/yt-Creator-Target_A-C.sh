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
sed -i d "$contentFile"

#   Add the shell utility to tell the script what to use when running the script.
sed '1 i #!/bin/sh' "$contentFile"
echo '#!/bin/sh' > "$contentFile"

#   Here we add an empty line in order to break commands away from the interperter from the rest of the script.
echo -en '\n' >> "$contentFile"

#####===[ Local Execution - Define Functions and Arrays
#########################################################################################################

#	Creator Video Array
vidArray=(
	"UCUpkp-6fXuG9dqfoJ99XTmw"
	"UC-AQKm7HUNMmxjdS371MSwg"
	"UC-eDKZ_PSz_JHynMf-Jp--A"
	"UC0aanx5rpr7D1M7KCFYzrLQ"
	"UC0twEKQY4LbteXfVq3nJQPg"
	"UC1hkAIJnb2CSmm7SPJaPR-A"
	"UC2C_jShtL725hvbm1arSV9w"
	"UC3XTzVzaHQEd30rQbuvCtTQ"
	"UC3cpN6gcJQqcCM6mxRUo_dA"
	"UC3g-w83Cb5pEAu5UmRrge-A"
	"UC3ltptWa0xfrDweghW94Acg"
	"UC4JL8XJ9dxqfvzTM8L5Sl3w"
	"UC4UNqGYuB2q49GzGD_CBIVQ"
	"UC6ablLabCW4pcNJwEtmZh2Q"
	"UC6sjkvDzyY0J8o7k2Kc5rEw"
	"UC7-E5xhZBZdW-8d7V80mzfg"
	"UC7FkqjV8SU5I8FCHXQSQe9Q"
	"UC7UiChjgT_LDKcr_8NEEbMA"
	"UC7lx9EQBwxPaRMlMom61-XQ"
	"UC7mFkx1Um4KJZKkUHsSV1uA"
	"UC9RM-iSvTu1uPJb8X5yp3EQ"
	"UCAG1ABZP-c7wuNt0fziHtsA"
	"UCAL3JXZSzSm8AlZyD3nQdBA"
	"UCAwniUYYxhjOGhM86x0h0Bg"
	"UCB07XDRsWAb4u3mJwk6OoRQ"
	"UCBNG0osIBAprVcZZ3ic84vw"
	"UCCODtTcd5M1JavPCOr_Uydg"
	"UCCXR2kCo7Lcw_BKwWxo09kw"
	"UCEOXxzW2vU0P-0THehuIIeg"
	"UCG-KntY7aVnIGXYEBQvmBAQ"
	"UCH-_hzb2ILSCo9ftVSnrCIQ"
	"UCIdcKbW1enq8S84aJ2OJeoQ"
	"UCJHA_jMfCvEnv-3kRjTCQXw"
	"UCJkMlOu7faDgqh4PfzbpLdg"
	"UCKab3hYnOoTZZbEUQBMx-ww"
	"UCL8w_A8p8P1HWI3k6PR5Z6w"
	"UCMmaBzfCCwZ2KqaBJjkj0fw"
	"UCO6nDCimkF79NZRRb8YiDcA"
	"UCP5tjEmvPItGyLhmjdwP7Ww"
	"UCRWyPm7MrfotIYF8A8MGV3g"
	"UCS0-VSAEnr67ase5z16IqrA"
	"UCSXVbHYeOe8yb9k0CuLSKcA"
	"UCSuHzQ3GrHSzoBbwrIq3LLA"
	"UCUMQFUkgaEE68_ujIdW2wAw"
	"UCVo63lbKHjC04KqYhwSZ_Pg"
	"UCVpankR4HtoAVtYnFDUieYA"
	"UCWCw2Sd7RlYJ2yuNVHDWNOA"
	"UCXuqSBlHAE6Xw-yeJA0Tunw"
	"UCYvEb6iLPxLPZTe6NcUUUeA"
	"UCYwVxWpjeKFWwu8TML-Te9A"
	"UCZ30YNIcUWuSz8eVJZtLEjw"
	"UCaQ0KQK_HrCD7a4fkgtCCsg"
	"UCbWcXB0PoqOsAvAdfzWMf0w"
	"UCcHBw_Rs56RFcisYAOlFfmQ"
	"UCe0DNp0mKMqrYVaTundyr9w"
	"UCggHoXaj8BQHIiPmOxezeWA"
	"UCircJf-FlToBNjuy9xG-i5A"
	"UCjU-Cwjfqbo2hMRItlXwnnQ"
	"UCjdQaSJCYS4o2eG93MvIwqg"
	"UCkO3godtBkGH4t9rYHqfF0g"
	"UCkyfHZ6bY2TjqbJhiH8Y2QQ"
	"UCm22FAXZMw1BaWeFszZxUKw"
	"UCm9K6rby98W8JigLoZOh6FQ"
	"UCmGSJVG3mCRXVOP4yZrU1Dw"
	"UCmJcrJ_30p6s_OTbyTFfbqQ"
	"UCncTjqw75krp9j_wRRh5Gvw"
	"UCo1pShh6dtg-T_ZZkgi_JDQ"
	"UCo_IB5145EVNcf8hw1Kku7w"
	"UCp1orOGJwZvjLAvckyxC4Nw"
	"UCpDmn2FfVYdPIDwRTcf5-OA"
	"UCpa-Zb0ZcQjTCPP1Dx_1M8Q"
	"UCqTYHSnBUXZamsVcOlQf-fg"
	"UCrTNhL_yO3tPTdQ5XgmmWjA"
	"UCsC--WvN66vZlDoYShzn4sA"
	"UCsXVk37bltHxD1rDPwtNM8Q"
	"UCtqxG9IrHFU_ID1khGvx9sA"
	"UCv_vLHiWVBh_FR9vbeuiY-A"
	"UCwO-UgquohXwoe7f0e6lMnw"
	"UCweFJojRAFuxyYxe4KHL8vw"
	"UCworsKCR-Sx6R6-BnIjS2MA"
	"UCwuALck_lp7LxzQcoskRjbQ"
	"UCxU5FvmDqAi2aJ9AzYA_syA"
	"UCxt9Pvye-9x_AIcb1UtmF1Q"
	"UCy0tKL1T7wFoYcxCe0xjN6Q"
    # ""
)

#	Write Function that we will use to write content to the contentfile to download videos.
Creator_Download () {
    echo yt-dlp --format "'$dlpformat'" --verbose --force-ipv4 --sleep-requests 1 --sleep-interval 5 --max-sleep-interval 30 --ignore-errors --no-continue --no-overwrites --download-archive "'$dlytDB'" --check-formats --concurrent-fragments 5  -o "'$subdirout'" --restrict-filenames  --embed-metadata --write-thumbnail  --throttled-rate 100K "'$videoVar'"  >> "$contentFile"
    echo -en '\n' >> "$contentFile"
}


#####===[ Local Execution
#########################################################################################################

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
    case "$ChannelName" in 
    "All Gas No Brakes") subdirout='/mnt/OpenDrive3/Videos/Creators/All Gas No Brakes/%(title)s.%(ext)s' ;;
    "ashens") subdirout='/mnt/OpenDrive3/Videos/Creators/Ashens/%(title)s.%(ext)s'  ;;
    "Babish Culinary Universe") subdirout='/mnt/OpenDrive3/Videos/Creators/Binging with Babish/%(title)s.%(ext)s' ;;
    "Billiam") subdirout='/mnt/OpenDrive3/Videos/Creators/Billiam/%(title)s.%(ext)s' ;;
    "BosnianBill") subdirout='/mnt/OpenDrive3/Videos/Creators/BosnianBill/%(title)s.%(ext)s' ;;
    "Brandon Sanderson") subdirout='/mnt/OpenDrive3/Videos/Creators/Brandon Sanderson/%(title)s.%(ext)s' ;;
    "CGP Grey") subdirout='/mnt/OpenDrive3/Videos/Creators/CGP Grey/%(title)s.%(ext)s' ;;
    "Captain Disillusion") subdirout='/mnt/OpenDrive3/Videos/Creators/Captain Disillusion/%(title)s.%(ext)s' ;;
    "Caroline Konstnar") subdirout='/mnt/OpenDrive3/Videos/Creators/Caroline Konstnar/%(title)s.%(ext)s' ;;
    "Channel 5 with Andrew Callaghan") subdirout='/mnt/OpenDrive3/Videos/Creators/All Gas No Brakes/%(title)s.%(ext)s' ;;
    "Clickspring") subdirout='/mnt/OpenDrive3/Videos/Creators/Clickspring/%(title)s.%(ext)s' ;;
    "Comedy Cheat Codes") subdirout='/mnt/OpenDrive3/Videos/Creators/Comedy Cheat Codes/%(title)s.%(ext)s' ;;
    "Court of Source") subdirout='/mnt/OpenDrive3/Videos/Creators/Court of Source/%(title)s.%(ext)s' ;;
    "Dan Bull") subdirout='/mnt/OpenDrive3/Videos/Creators/Dan Bull/%(title)s.%(ext)s' ;;
    "Defunctland") subdirout='/mnt/OpenDrive3/Videos/Creators/Defunctland/%(title)s.%(ext)s' ;;
    "Dime Store Adventures") subdirout='/mnt/OpenDrive3/Videos/Creators/Dime Store Adventures/%(title)s.%(ext)s' ;;
    "Extra History") subdirout='/mnt/OpenDrive3/Videos/Creators/Extra History/%(title)s.%(ext)s' ;;
    "Fredrik Knudsen") subdirout='/mnt/OpenDrive3/Videos/Creators/Fredrik Knudsen/%(title)s.%(ext)s' ;;
    "Historia Civilis") subdirout='/mnt/OpenDrive3/Videos/Creators/Historia Civilis/%(title)s.%(ext)s' ;;
    "History Buffs") subdirout='/mnt/OpenDrive3/Videos/Creators/History Buffs/%(title)s.%(ext)s' ;;
    "iilluminaughtii") subdirout='/mnt/OpenDrive3/Videos/Creators/iilluminaughtii/%(title)s.%(ext)s'  ;;
    "Invicta") subdirout='/mnt/OpenDrive3/Videos/Creators/Invicta/%(title)s.%(ext)s' ;;
    "ISHITANI FURNITURE") subdirout='/mnt/OpenDrive3/Videos/Creators/ISHITANI FURNITURE/%(title)s.%(ext)s'  ;;
    "J C S") subdirout='/mnt/OpenDrive3/Videos/Creators/JCS Criminal Psychology/%(title)s.%(ext)s' ;;
    "JCS - Criminal Psychology") subdirout='/mnt/OpenDrive3/Videos/Creators/JCS Criminal Psychology/%(title)s.%(ext)s' ;;
    "j aubrey") subdirout='/mnt/OpenDrive3/Videos/Creators/JAubrey/%(title)s.%(ext)s'  ;;
    "Jaboody Dubs") subdirout='/mnt/OpenDrive3/Videos/Creators/Jaboody Dubs/%(title)s.%(ext)s' ;;
    "Jenny Nicholson") subdirout='/mnt/OpenDrive3/Videos/Creators/Jenny Nicholson/%(title)s.%(ext)s' ;;
    "Jim Browning") subdirout='/mnt/OpenDrive3/Videos/Creators/Jim Browning/%(title)s.%(ext)s' ;;
    "Jim Sterling") subdirout='/mnt/OpenDrive3/Videos/Creators/Jim Sterling/%(title)s.%(ext)s' ;;
    "Johnny Harris") subdirout='/mnt/OpenDrive3/Videos/Creators/Johnny Harris/%(title)s.%(ext)s' ;;
    "Josh Strife Hayes") subdirout='/mnt/OpenDrive3/Videos/Creators/Josh Strife Hayes/%(title)s.%(ext)s' ;;
    "Karl Jobst") subdirout='/mnt/OpenDrive3/Videos/Creators/Karl Jobst/%(title)s.%(ext)s' ;;
    "Kilian Experience") subdirout='/mnt/OpenDrive3/Videos/Creators/Kilian Experience/%(title)s.%(ext)s' ;;
    "Kings and Generals") subdirout='/mnt/OpenDrive3/Videos/Creators/Kings and Generals/%(title)s.%(ext)s' ;;
    "Kitboga") subdirout='/mnt/OpenDrive3/Videos/Creators/Kitboga/%(title)s.%(ext)s' ;;
    "Kurzgesagt – In a Nutshell") subdirout='/mnt/OpenDrive3/Videos/Creators/Kurzgesagt/%(title)s.%(ext)s' ;;
    "LastWeekTonight") subdirout='/mnt/OpenDrive3/Videos/Creators/Last Week Tonight/%(title)s.%(ext)s' ;;
    "LegalEagle") subdirout='/mnt/OpenDrive3/Videos/Creators/Legal Eagle/%(title)s.%(ext)s' ;;
    "Linus Tech Tips") subdirout='/mnt/OpenDrive3/Videos/Creators/Linus Tech Tips/%(title)s.%(ext)s' ;;
    "LockPickingLawyer") subdirout='/mnt/OpenDrive3/Videos/Creators/LockPickingLawyer/%(title)s.%(ext)s' ;;
    "Lockstin and Gnoggin") subdirout='/mnt/OpenDrive3/Videos/Creators/Lockstin and Gnoggin/%(title)s.%(ext)s' ;;
    "Naomi Brockwell: NBTV") subdirout='/mnt/OpenDrive3/Videos/Creators/Naomi Brockwell: NBTV/%(title)s.%(ext)s' ;;
    "Nerdwriter1") subdirout='/mnt/OpenDrive3/Videos/Creators/Nerdwriter1/%(title)s.%(ext)s' ;;
    "OfficialNerdCubed") subdirout='/mnt/OpenDrive3/Videos/Creators/OfficialNerdCubed/%(title)s.%(ext)s' ;;
    "Oxhorn") subdirout='/mnt/OpenDrive3/Videos/Creators/Oxhorn/%(title)s.%(ext)s' ;;
    "Primitive Technology") subdirout='/mnt/OpenDrive3/Videos/Creators/Primitive Technology/%(title)s.%(ext)s' ;;
    "Puffin Forest") subdirout='/mnt/OpenDrive3/Videos/Creators/Puffin Forest/%(title)s.%(ext)s' ;;
    "psychotrip") subdirout='/mnt/OpenDrive3/Videos/Creators/psychotrip/%(title)s.%(ext)s'  ;;
    "RamZaes") subdirout='/mnt/OpenDrive3/Videos/Creators/RamZaes/%(title)s.%(ext)s' ;;
    "Random Game Reviews") subdirout='/mnt/OpenDrive3/Videos/Creators/Random Game Reviews/%(title)s.%(ext)s' ;;
    "RealLifeLore") subdirout='/mnt/OpenDrive3/Videos/Creators/RealLifeLore/%(title)s.%(ext)s' ;;
    "RedLetterMedia") subdirout='/mnt/OpenDrive3/Videos/Creators/RedLetterMedia/%(title)s.%(ext)s' ;;
    "Regular Car Reviews") subdirout='/mnt/OpenDrive3/Videos/Creators/Regular Car Reviews/%(title)s.%(ext)s' ;;
    "Runesmith") subdirout='/mnt/OpenDrive3/Videos/Creators/RuneSmith/%(title)s.%(ext)s' ;;
    "ShaneBrained") subdirout='/mnt/OpenDrive3/Videos/Creators/ShaneBrained/%(title)s.%(ext)s' ;;
    "ShoddyCast") subdirout='/mnt/OpenDrive3/Videos/Creators/ShoddyCast/%(title)s.%(ext)s' ;;
    "Shoe0nHead Live") subdirout='/mnt/OpenDrive3/Videos/Creators/Shoe0nHead/%(title)s.%(ext)s' ;;
    "Shoe0nHead") subdirout='/mnt/OpenDrive3/Videos/Creators/Shoe0nHead/%(title)s.%(ext)s' ;;
    "Square Table Gaming") subdirout='/mnt/OpenDrive3/Videos/Creators/Square Table Gaming/%(title)s.%(ext)s' ;;
    "Storied") subdirout='/mnt/OpenDrive3/Videos/Creators/Storied/%(title)s.%(ext)s' ;;
    "Tales of Alethrion") subdirout='/mnt/OpenDrive3/Videos/Creators/Tales of Alethrion/%(title)s.%(ext)s' ;;
    "Technology Connections") subdirout='/mnt/OpenDrive3/Videos/Creators/Technology Connections/%(title)s.%(ext)s' ;;
    "thebrainscoop") subdirout='/mnt/OpenDrive3/Videos/Creators/thebrainscoop/%(title)s.%(ext)s'  ;;
    "The Cosmonaut Variety Hour") subdirout='/mnt/OpenDrive3/Videos/Creators/The Cosmonaut Variety Hour/%(title)s.%(ext)s' ;;
    "The Game Theorists") subdirout='/mnt/OpenDrive3/Videos/Creators/The Game Theorists/%(title)s.%(ext)s' ;;
    "This is Dan Bell.") subdirout='/mnt/OpenDrive3/Videos/Creators/This is Dan Bell/%(title)s.%(ext)s' ;;
    "Thomas Frank") subdirout='/mnt/OpenDrive3/Videos/Creators/Thomas Frank/%(title)s.%(ext)s' ;;
    "Toatapio Nuva") subdirout='/mnt/OpenDrive3/Videos/Creators/Toatapio Nuva/%(title)s.%(ext)s' ;;
    "Trekspertise") subdirout='/mnt/OpenDrive3/Videos/Creators/Trekspertise/%(title)s.%(ext)s' ;;
    "TrixyBlox") subdirout='/mnt/OpenDrive3/Videos/Creators/TrixyBlox/%(title)s.%(ext)s' ;;
    "Two Cents") subdirout='/mnt/OpenDrive3/Videos/Creators/Two Cents/%(title)s.%(ext)s' ;;
    "VaatiVidya") subdirout='/mnt/OpenDrive3/Videos/Creators/VaatiVidya/%(title)s.%(ext)s' ;;
    "Viakavish") subdirout='/mnt/OpenDrive3/Videos/Creators/Viakavish/%(title)s.%(ext)s' ;;
    "Watcher") subdirout='/mnt/OpenDrive3/Videos/Creators/Watcher/%(title)s.%(ext)s' ;;
    "Wendigoon") subdirout='/mnt/OpenDrive3/Videos/Creators/Wendigoon/%(title)s.%(ext)s' ;;
    "Wendover Productions") subdirout='/mnt/OpenDrive3/Videos/Creators/Wendover Productions/%(title)s.%(ext)s' ;;
    "Worldbuilding Notes") subdirout='/mnt/OpenDrive3/Videos/Creators/Worldbuilding Notes/%(title)s.%(ext)s' ;;
    "YOGSCAST Lewis and Simon") subdirout='/mnt/OpenDrive3/Videos/Creators/YOGSCAST Lewis and Simon/%(title)s.%(ext)s' ;;
    "Ze Frank") subdirout='/mnt/OpenDrive3/Videos/Creators/zefrank/%(title)s.%(ext)s' ;;
    "Zee Bashew") subdirout='/mnt/OpenDrive3/Videos/Creators/Zee Bashew/%(title)s.%(ext)s' ;;
    "Zullie the Witch") subdirout='/mnt/OpenDrive3/Videos/Creators/Zulliethe Witch/%(title)s.%(ext)s' ;;
    #"") subdirout='/mnt/OpenDrive3/Videos/Creators//%(title)s.%(ext)s' ;;
    esac

#  Here we reset the n and m variables that need to be offset to account for the ChannelName taking up place 0 on the titles ID. 
    clear
    # n is for the title set
    n=1;
    # m is for the video set
    m=0;
    until [ $n -ge $ti ]
    do
        vidVar="$( echo "${videoIDs[$m]}" | sed 's/^ *//g' )"
        videoUri="${ytWatch}${vidVar}"
        videoVar="${videoUri}"

        Creator_Download
        ((n++))
        ((m++))
    done


    echo "Writing creator: $ChannelName..."


done


#####===[ Begin Downloading with local execution
#########################################################################################################

sh "$contentFile"

