#!/bin/sh

Creator_Download () {
        echo yt-dlp --format "'$dlpformat'" --verbose --force-ipv4 --sleep-requests 1 --sleep-interval 5 --max-sleep-interval 30 --ignore-errors --no-continue --no-overwrites --download-archive "'$dlytDB'" --check-formats --concurrent-fragments 5  -o "'$subdirout'" --restrict-filenames --embed-metadata --throttled-rate 100K "'$videoVar'"  >> "$contentFile"
        echo -en '\n' >> "$contentFile"
}

