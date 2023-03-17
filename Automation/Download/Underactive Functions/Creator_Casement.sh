#!/bin/sh

Creator_Casement () {
    source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/main/subscribers/Defined/channel_array.sh)

    source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/main/Automation/Download/Underactive%20Functions/Creator_DownloadV2.sh)

    ytChantem="https://www.youtube.com/channel/"
    ytWatch="https://www.youtube.com/watch?v="
    ytXml="https://www.youtube.com/feeds/videos.xml?channel_id="

    for VidChan in "${vidArray[@]}"; do

        channelID="$(echo "${VidChan}")"
        channelXMl="${ytXml}${channelID}"
        channelID="${ytChantem}${channelID}"

        titles_set="$( curl -s "$channelXMl" | grep -E "<title>" | sed -e 's/<[^>]*>//g' )"
        readarray -t titleIDs <<<"$titles_set"

        # Grab the length of the array - titles
        ti="$( echo "${#titleIDs[@]}" )"	

        videoID_set="$( curl -s "$channelXMl" | grep -E "<yt:videoId>" | sed -e 's/<[^>]*>//g' )"
        readarray -t videoIDs <<<"$videoID_set"

        # Grab the length of the array - videos
        vi="$( echo "${#videoIDs[@]}" )"	

        ChannelName="$( echo "${titleIDs[0]}" | sed 's/^ *//g' )"
        if [[ "$ChannelName" == *"&amp"* ]] ; then ChannelName="$( echo "${ChannelName}" | sed 's/&amp;/and/g'  )"; fi
        if [[ "$ChannelName" == *"& amp"* ]]; then ChannelName="$( echo "${ChannelName}" | sed 's/& amp;/and/g' )"; fi

        case "$ChannelName" in 
        "All Gas No Brakes") subdirout='/mnt/OpenDrive3/Videos/Creators/All Gas No Brakes/%(title")s.%(ext")s';;
        "ashens") subdirout='/mnt/OpenDrive3/Videos/Creators/Ashens/%(title")s.%(ext")s'  ;;
        "Babish Culinary Universe") subdirout='/mnt/OpenDrive3/Videos/Creators/Binging with Babish/%(title")s.%(ext")s';;
        "Billiam") subdirout='/mnt/OpenDrive3/Videos/Creators/Billiam/%(title")s.%(ext")s';;
        "BosnianBill") subdirout='/mnt/OpenDrive3/Videos/Creators/BosnianBill/%(title")s.%(ext")s';;
        "Brandon Sanderson") subdirout='/mnt/OpenDrive3/Videos/Creators/Brandon Sanderson/%(title")s.%(ext")s';;
        "CGP Grey") subdirout='/mnt/OpenDrive3/Videos/Creators/CGP Grey/%(title")s.%(ext")s';;
        "Captain Disillusion") subdirout='/mnt/OpenDrive3/Videos/Creators/Captain Disillusion/%(title")s.%(ext")s';;
        "Caroline Konstnar") subdirout='/mnt/OpenDrive3/Videos/Creators/Caroline Konstnar/%(title")s.%(ext")s';;
        "Channel 5 with Andrew Callaghan") subdirout='/mnt/OpenDrive3/Videos/Creators/All Gas No Brakes/%(title")s.%(ext")s';;
        "Clickspring") subdirout='/mnt/OpenDrive3/Videos/Creators/Clickspring/%(title")s.%(ext")s';;
        "Comedy Cheat Codes") subdirout='/mnt/OpenDrive3/Videos/Creators/Comedy Cheat Codes/%(title")s.%(ext")s';;
        "Court of Source") subdirout='/mnt/OpenDrive3/Videos/Creators/Court of Source/%(title")s.%(ext")s';;
        "Dan Bull") subdirout='/mnt/OpenDrive3/Videos/Creators/Dan Bull/%(title")s.%(ext")s';;
        "Defunctland") subdirout='/mnt/OpenDrive3/Videos/Creators/Defunctland/%(title")s.%(ext")s';;
        "Dime Store Adventures") subdirout='/mnt/OpenDrive3/Videos/Creators/Dime Store Adventures/%(title")s.%(ext")s';;
        "Extra History") subdirout='/mnt/OpenDrive3/Videos/Creators/Extra History/%(title")s.%(ext")s';;
        "Fredrik Knudsen") subdirout='/mnt/OpenDrive3/Videos/Creators/Fredrik Knudsen/%(title")s.%(ext")s';;
        "Historia Civilis") subdirout='/mnt/OpenDrive3/Videos/Creators/Historia Civilis/%(title")s.%(ext")s';;
        "History Buffs") subdirout='/mnt/OpenDrive3/Videos/Creators/History Buffs/%(title")s.%(ext")s';;
        "iilluminaughtii") subdirout='/mnt/OpenDrive3/Videos/Creators/iilluminaughtii/%(title")s.%(ext")s'  ;;
        "Invicta") subdirout='/mnt/OpenDrive3/Videos/Creators/Invicta/%(title")s.%(ext")s';;
        "ISHITANI FURNITURE") subdirout='/mnt/OpenDrive3/Videos/Creators/ISHITANI FURNITURE/%(title")s.%(ext")s'  ;;
        "J C S") subdirout='/mnt/OpenDrive3/Videos/Creators/JCS Criminal Psychology/%(title")s.%(ext")s';;
        "JCS - Criminal Psychology") subdirout='/mnt/OpenDrive3/Videos/Creators/JCS Criminal Psychology/%(title")s.%(ext")s';;
        "j aubrey") subdirout='/mnt/OpenDrive3/Videos/Creators/JAubrey/%(title")s.%(ext")s'  ;;
        "Jaboody Dubs") subdirout='/mnt/OpenDrive3/Videos/Creators/Jaboody Dubs/%(title")s.%(ext")s';;
        "Jenny Nicholson") subdirout='/mnt/OpenDrive3/Videos/Creators/Jenny Nicholson/%(title")s.%(ext")s';;
        "Jim Browning") subdirout='/mnt/OpenDrive3/Videos/Creators/Jim Browning/%(title")s.%(ext")s';;
        "Jim Sterling") subdirout='/mnt/OpenDrive3/Videos/Creators/Jim Sterling/%(title")s.%(ext")s';;
        "Johnny Harris") subdirout='/mnt/OpenDrive3/Videos/Creators/Johnny Harris/%(title")s.%(ext")s';;
        "Josh Strife Hayes") subdirout='/mnt/OpenDrive3/Videos/Creators/Josh Strife Hayes/%(title")s.%(ext")s';;
        "Karl Jobst") subdirout='/mnt/OpenDrive3/Videos/Creators/Karl Jobst/%(title")s.%(ext")s';;
        "Kilian Experience") subdirout='/mnt/OpenDrive3/Videos/Creators/Kilian Experience/%(title")s.%(ext")s';;
        "Kings and Generals") subdirout='/mnt/OpenDrive3/Videos/Creators/Kings and Generals/%(title")s.%(ext")s';;
        "Kitboga") subdirout='/mnt/OpenDrive3/Videos/Creators/Kitboga/%(title")s.%(ext")s';;
        "Kurzgesagt – In a Nutshell") subdirout='/mnt/OpenDrive3/Videos/Creators/Kurzgesagt/%(title")s.%(ext")s';;
        "LastWeekTonight") subdirout='/mnt/OpenDrive3/Videos/Creators/Last Week Tonight/%(title")s.%(ext")s';;
        "LegalEagle") subdirout='/mnt/OpenDrive3/Videos/Creators/Legal Eagle/%(title")s.%(ext")s';;
        "Linus Tech Tips") subdirout='/mnt/OpenDrive3/Videos/Creators/Linus Tech Tips/%(title")s.%(ext")s';;
        "LockPickingLawyer") subdirout='/mnt/OpenDrive3/Videos/Creators/LockPickingLawyer/%(title")s.%(ext")s';;
        "Lockstin and Gnoggin") subdirout='/mnt/OpenDrive3/Videos/Creators/Lockstin and Gnoggin/%(title")s.%(ext")s';;
        "Naomi Brockwell: NBTV") subdirout='/mnt/OpenDrive3/Videos/Creators/Naomi Brockwell: NBTV/%(title")s.%(ext")s';;
        "Nerdwriter1") subdirout='/mnt/OpenDrive3/Videos/Creators/Nerdwriter1/%(title")s.%(ext")s';;
        "OfficialNerdCubed") subdirout='/mnt/OpenDrive3/Videos/Creators/OfficialNerdCubed/%(title")s.%(ext")s';;
        "Oxhorn") subdirout='/mnt/OpenDrive3/Videos/Creators/Oxhorn/%(title")s.%(ext")s';;
        "Primitive Technology") subdirout='/mnt/OpenDrive3/Videos/Creators/Primitive Technology/%(title")s.%(ext")s';;
        "Puffin Forest") subdirout='/mnt/OpenDrive3/Videos/Creators/Puffin Forest/%(title")s.%(ext")s';;
        "psychotrip") subdirout='/mnt/OpenDrive3/Videos/Creators/psychotrip/%(title")s.%(ext")s'  ;;
        "RamZaes") subdirout='/mnt/OpenDrive3/Videos/Creators/RamZaes/%(title")s.%(ext")s';;
        "Random Game Reviews") subdirout='/mnt/OpenDrive3/Videos/Creators/Random Game Reviews/%(title")s.%(ext")s';;
        "RealLifeLore") subdirout='/mnt/OpenDrive3/Videos/Creators/RealLifeLore/%(title")s.%(ext")s';;
        "RedLetterMedia") subdirout='/mnt/OpenDrive3/Videos/Creators/RedLetterMedia/%(title")s.%(ext")s';;
        "Regular Car Reviews") subdirout='/mnt/OpenDrive3/Videos/Creators/Regular Car Reviews/%(title")s.%(ext")s';;
        "Runesmith") subdirout='/mnt/OpenDrive3/Videos/Creators/RuneSmith/%(title")s.%(ext")s';;
        "ShaneBrained") subdirout='/mnt/OpenDrive3/Videos/Creators/ShaneBrained/%(title")s.%(ext")s';;
        "ShoddyCast") subdirout='/mnt/OpenDrive3/Videos/Creators/ShoddyCast/%(title")s.%(ext")s';;
        "Shoe0nHead Live") subdirout='/mnt/OpenDrive3/Videos/Creators/Shoe0nHead/%(title")s.%(ext")s';;
        "Shoe0nHead") subdirout='/mnt/OpenDrive3/Videos/Creators/Shoe0nHead/%(title")s.%(ext")s';;
        "Square Table Gaming") subdirout='/mnt/OpenDrive3/Videos/Creators/Square Table Gaming/%(title")s.%(ext")s';;
        "Storied") subdirout='/mnt/OpenDrive3/Videos/Creators/Storied/%(title")s.%(ext")s';;
        "Tales of Alethrion") subdirout='/mnt/OpenDrive3/Videos/Creators/Tales of Alethrion/%(title")s.%(ext")s';;
        "Technology Connections") subdirout='/mnt/OpenDrive3/Videos/Creators/Technology Connections/%(title")s.%(ext")s';;
        "thebrainscoop") subdirout='/mnt/OpenDrive3/Videos/Creators/thebrainscoop/%(title")s.%(ext")s'  ;;
        "The Cosmonaut Variety Hour") subdirout='/mnt/OpenDrive3/Videos/Creators/The Cosmonaut Variety Hour/%(title")s.%(ext")s';;
        "The Game Theorists") subdirout='/mnt/OpenDrive3/Videos/Creators/The Game Theorists/%(title")s.%(ext")s';;
        "This is Dan Bell.") subdirout='/mnt/OpenDrive3/Videos/Creators/This is Dan Bell/%(title")s.%(ext")s';;
        "Thomas Frank") subdirout='/mnt/OpenDrive3/Videos/Creators/Thomas Frank/%(title")s.%(ext")s';;
        "Toatapio Nuva") subdirout='/mnt/OpenDrive3/Videos/Creators/Toatapio Nuva/%(title")s.%(ext")s';;
        "Trekspertise") subdirout='/mnt/OpenDrive3/Videos/Creators/Trekspertise/%(title")s.%(ext")s';;
        "TrixyBlox") subdirout='/mnt/OpenDrive3/Videos/Creators/TrixyBlox/%(title")s.%(ext")s';;
        "Two Cents") subdirout='/mnt/OpenDrive3/Videos/Creators/Two Cents/%(title")s.%(ext")s';;
        "VaatiVidya") subdirout='/mnt/OpenDrive3/Videos/Creators/VaatiVidya/%(title")s.%(ext")s';;
        "Viakavish") subdirout='/mnt/OpenDrive3/Videos/Creators/Viakavish/%(title")s.%(ext")s';;
        "Watcher") subdirout='/mnt/OpenDrive3/Videos/Creators/Watcher/%(title")s.%(ext")s';;
        "Wendigoon") subdirout='/mnt/OpenDrive3/Videos/Creators/Wendigoon/%(title")s.%(ext")s';;
        "Wendover Productions") subdirout='/mnt/OpenDrive3/Videos/Creators/Wendover Productions/%(title")s.%(ext")s';;
        "Worldbuilding Notes") subdirout='/mnt/OpenDrive3/Videos/Creators/Worldbuilding Notes/%(title")s.%(ext")s';;
        "YOGSCAST Lewis and Simon") subdirout='/mnt/OpenDrive3/Videos/Creators/YOGSCAST Lewis and Simon/%(title")s.%(ext")s';;
        "Ze Frank") subdirout='/mnt/OpenDrive3/Videos/Creators/zefrank/%(title")s.%(ext")s';;
        "Zee Bashew") subdirout='/mnt/OpenDrive3/Videos/Creators/Zee Bashew/%(title")s.%(ext")s';;
        "Zullie the Witch") subdirout='/mnt/OpenDrive3/Videos/Creators/Zulliethe Witch/%(title")s.%(ext")s';;
        esac


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


        echo "$ChannelName"
        echo "$videoVar"
        echo "$subdirout"

    done

clear

}

