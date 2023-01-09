#!/bin/sh

Video_Report () {
    numTS="$(find . -mindepth 1 -type f -name "*.ts" -exec printf x \; | wc -c)"
    numM4V="$(find . -mindepth 1 -type f -name "*.m4v" -exec printf x \; | wc -c)"
    numMP4="$(find . -mindepth 1 -type f -name "*.mp4" -exec printf x \; | wc -c)"
    numWAV="$(find . -mindepth 1 -type f -name "*.wav" -exec printf x \; | wc -c)"
    numMKV="$(find . -mindepth 1 -type f -name "*.mkv" -exec printf x \; | wc -c)"
    numAVI="$(find . -mindepth 1 -type f -name "*.avi" -exec printf x \; | wc -c)"
    numWEBM="$(find . -mindepth 1 -type f -name "*.webm" -exec printf x \; | wc -c)"
    numSMOL="$(find . -name "*.*" -type f -size -5M -exec printf x \; | wc -c)"
    numSUM="$(find . -mindepth 1 -type f -name "*.*" -exec printf x \; | wc -c)"
    numNULL="$(find . -mindepth 1 -not -name "*.ts" -not -name "*.m4v" -not -name "*.wav" -not -name "*.avi" -not -name "*.mp4" -not -name "*.mkv" -not -name "*.webm" -type f -exec printf x \; | wc -c)"
    numVID=$(($numTS + $numM4V + $numWAV + $numAVI + $numMKV + $numMP4 + $numWEBM))

    recReport_miss="Format\t\t\t\tExt\n"
    recReport="====================================\n"
    recReport="${recReport}==== Number of File Types report ===\n" 
    recReport="${recReport}====================================\n\n" 
    recReport="${recReport}Video Format\t\t   Number Of\n" 
    if [ "$numTS" -gt "0" ]; then recReport="${recReport}ts\t\t\t\t${numTS}\n" ; else recReport_miss="${recReport_miss}Transport Stream \t\tTS\n"; fi
    if [ "$numM4V" -gt "0" ]; then recReport="${recReport}m4v\t\t\t\t${numM4V}\n" ; else recReport_miss="${recReport_miss}Apple Video Container \t\tM4v\n"; fi
    if [ "$numWAV" -gt "0" ]; then recReport="${recReport}wav\t\t\t\t${numWAV}\n" ; else recReport_miss="${recReport_miss}Waveform \t\t\tWAV\n"; fi
    if [ "$numAVI" -gt "0" ]; then recReport="${recReport}avi\t\t\t\t${numAVI}\n" ; else recReport_miss="${recReport_miss}Audio Video Interleave \t\tAVI\n"; fi
    if [ "$numMKV" -gt "0" ]; then recReport="${recReport}mkv\t\t\t\t${numMKV}\n" ; else recReport_miss="${recReport_miss}Matroska Video \t\t\tMKV\n"; fi
    if [ "$numMP4" -gt "0" ]; then recReport="${recReport}mp4\t\t\t\t${numMP4}\n" ; else recReport_miss="${recReport_miss}Multimedia Container \t\tMP4\n"; fi
    if [ "$numWEBM" -gt "0" ]; then recReport="${recReport}webm\t\t\t\t${numWEBM}\n" ; else recReport_miss="${recReport_miss}Eminence Free Container \tWEBM\n"; fi
    recReport="${recReport}--------------- Data ---------------\n"
    recReport="${recReport}Total Number\t\t  Number Of\n"
    recReport="${recReport}files\t\t\t\t${numSUM}\n"
    recReport="${recReport}video files\t\t\t${numVID}\n"
    recReport="${recReport}non-video files\t\t\t${numNULL}\n"
    recReport="${recReport}----- Not Present within report ----\n"
    recReport="${recReport}${recReport_miss}"
    echo -e "$recReport"

}


# Video_Report