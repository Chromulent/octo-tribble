#!/bin/sh

"yes_no_whiptail" () {
       if whiptail --yesno "Subscriber ${subname} has uploaded a new video entitled: ${title}, do you want to download this?" 20 60 ;then
         yt-dlp --format "$dlpformat" --verbose --force-ipv4 --sleep-requests 1 --sleep-interval 5 --max-sleep-interval 30 --ignore-errors --no-continue --no-overwrites --download-archive /home/blackwood/Downloads/.mydownloads  --check-formats --concurrent-fragments 5  -o "$subdirout" --restrict-filenames  --throttled-rate 100K "$videoVar"  >> "$contentFile"
      else
         echo No
       fi
}

# yes_no_whiptail

