#!/bin/sh

Vid-T () {

  #=====[ Nested Functions
    # Define functions that we are going to be using for cleanup
    if_aac_m4a_del () {
    for f in *.aac; do
    [ -e "${f%.*}.m4a" ] && rm -rf "$f"; done }

    if_flac_mp3_del () {
    for f in *.flac; do
    [ -e "${f%.*}.mp3" ] && rm -rf "$f"; done }

    if_webp_png_del () {
    for f in *.webp; do
    [ -e "${f%.*}.png" ] && rm -rf "$f"; done }

    if_3gp_mp4_del () {
    for f in *.3gp; do
    [ -e "${f%.*}.mp4" ] && rm -rf "$f"; done }

    if_mov_webm_del () {
    for f in *.mov; do
    [ -e "${f%.*}.webm" ] && rm -rf "$f"; done }

    if_ts_mp4_del () {
    for f in *.ts; do
    [ -e "${f%.*}.mp4" ] && rm -rf "$f"; done }

    if_m4v_mkv_del () {
    for f in *.m4v; do
    [ -e "${f%.*}.mkv" ] && rm -rf "$f"; done }

    if_avi_mp4_del () {
    for f in *.avi; do
    [ -e "${f%.*}.mp4" ] && rm -rf "$f"; done }

    if_avi_webm_del () {
    for f in *.avi; do
    [ -e "${f%.*}.webm" ] && rm -rf "$f"; done }

    if_mkv_mp4_del () {
    for f in *.mkv; do
    [ -e "${f%.*}.mp4" ] && rm -rf "$f"; done }

    if_mp4_webm_del () {
    for f in *.mp4; do
    [ -e "${f%.*}.webm" ] && rm -rf "$f"; done }

    if_very_smol_del () {
    for f in *.*; do
    fsize=$(find "$f" -printf "%s")
    if [[ "$fsize" -lt "500000"  ]] ;
        then rm -rf "$f" ; 
    fi
    done }

  #=====[ Array Definition and Population 
    #   First we define an empty array that we will populate 
    extArray=()
    #   Next we look at all possible extensions within all directories and store that within our next array
    ##  This can include broken files but we will not add these if they do not conform with the extensions that we are looking for
    lkvArray="$(find ./ -type f -name "*\.*" -printf "%f\n" | awk -F . '!seen[$NF]++ {print $NF}')"

    #   Now we look at each possible extension within all directories
    ##  If an extension matches our defined criteria, then it is added it our extArray for processing and if not then it is essentially discarded
    for lkv in ${lkvArray[@]}; do

        if [[ "$lkv" == *aac* ]];  then extArray=( "$lkv" "${extArray[@]}" ); fi 
        if [[ "$lkv" == *flac* ]]; then extArray=( "$lkv" "${extArray[@]}" ); fi 
        if [[ "$lkv" == *webp* ]]; then extArray=( "$lkv" "${extArray[@]}" ); fi 
        if [[ "$lkv" == *m4v* ]];  then extArray=( "$lkv" "${extArray[@]}" ); fi 
        if [[ "$lkv" == *3gp* ]];  then extArray=( "$lkv" "${extArray[@]}" ); fi 
        if [[ "$lkv" == *mov* ]];  then extArray=( "$lkv" "${extArray[@]}" ); fi 
        if [[ "$lkv" == *ts*  ]];  then extArray=( "$lkv" "${extArray[@]}" ); fi 
        if [[ "$lkv" == *avi* ]];  then extArray=( "$lkv" "${extArray[@]}" ); fi 
        if [[ "$lkv" == *mkv* ]];  then extArray=( "$lkv" "${extArray[@]}" ); fi 
        if [[ "$lkv" == *mp4* ]];  then extArray=( "$lkv" "${extArray[@]}" ); fi 
        # if [[ "$lkv" == *ext* ]]; then extArray=( "$lkv" "${extArray[@]}" ); fi 
        # if [[ "$lkv" == *ext* ]]; then extArray=( "${extArray[@]}" "$lkv" ); fi 
        if [[ "$lkv" == *webm* ]]; then extArray=( "${extArray[@]}" "$lkv" ); fi 

    done

  #=====[ Transmorgification and Untarnish
    # For each extension within our array
    for ext in ${extArray[@]}; do
    # re-define the variable for each extension so that it can look spefically at files with that same extension
    ext=".$ext"
    # Get the total number of files within this directory that has the total number of files that we are intending on using within this array  
    numExt="$(find . -mindepth 1 -type f -name "*$ext" -exec printf x \; | wc -c)"
    sleep 3s
    # If the total number is greater than zero then add all files within the all folders to the opArr array.
    if (( $numExt > 0 )); then opArr="$( find . -mindepth 1 -type f -name "*$ext" )"; fi

    # Read all variables from the opArr array into our newly defined newOpArr, yeah I know original.
    readarray -t newOpArr < <(printf '%b\n' "${opArr[@]}")
    
    # for every single file within the array, if the extension matches then perform the coordinating task for conversions for every file containing that extension
    for opVal in "${newOpArr[@]}" ; do
    
        if [[ "$ext" == *.aac* ]];    then ffmpeg -y -i "$opVal" -codec: copy "${opVal%.*}.m4a"; fi 
        if [[ "$ext" == *.flac* ]];   then ffmpeg -y -i "$opVal" -acodec libmp3lame -ab 128k "${opVal%.*}.mp3"; fi 
        if [[ "$ext" == *.webp* ]];   then ffmpeg -y -i "$opVal" "${opVal%.*}.png"; fi 
        if [[ "$ext" == *.m4v* ]];    then ffmpeg -y -i "$opVal" -c:v copy -c:a copy "${opVal%.*}.mkv"; fi 
        if [[ "$ext" == *.3gp* ]];    then ffmpeg -y -i "$opVal" -c:v copy -c:a copy "${opVal%.*}.mp4"; fi
        if [[ "$ext" == *.mov* ]];    then ffmpeg -y -i "$opVal"  -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis "${opVal%.*}.webm"; fi
        if [[ "$ext" == *.ts* ]];     then ffmpeg -y -i "$opVal" "${opVal%.*}.mp4"; fi   
      # if [[ "$ext" == *.avi* ]];    then ffmpeg -y -i "$opVal" -x265-params crf=25 "${opVal%.*}.webm"; fi 
        if [[ "$ext" == *.avi* ]];    then ffmpeg -y -i "$opVal" -c:v copy -c:a copy -y "${opVal%.*}.mp4"; fi 
      # if [[ "$ext" == *.mkv* ]];    then ffmpeg -y -i "$opVal" -c copy "${opVal%.*}.mp4"; fi 
        if [[ "$ext" == *.mkv* ]];    then ffmpeg -y -i "$opVal" -map 0:v -c:a aac -c:v copy "${opVal%.*}.mp4"; fi 
      # if [[ "$ext" == *.mkv* ]];    then ffmpeg -y -i "$opVal" -vf subtitles=input.mkv "${opVal%.*}.mp4"; fi 
      # if [[ "$ext" == *.mkv* ]];    then ffmpeg -y -i "$opVal" -c copy -c:s mov_text "${opVal%.*}.mp4"; fi 
        if [[ "$ext" == *.mp4* ]];    then ffmpeg -y -i "$opVal" -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis "${opVal%.*}.webm"; fi 
    done   

        # after the conversion if the file is too small then delete it, and if the extension matches a file that we converted from then delete the original. 
        if_very_smol_del
        if [[ "$ext" == *.aac* ]];  then if_aac_m4a_del; fi 
        if [[ "$ext" == *.flac* ]]; then if_flac_mp3_del; fi 
        if [[ "$ext" == *.webp* ]]; then if_webp_png_del; fi 
        if [[ "$ext" == *.m4v* ]];  then if_m4v_mkv_del; fi 
        if [[ "$ext" == *.3gp* ]];  then if_3gp_mp4_del; fi 
        if [[ "$ext" == *.mov* ]];  then if_mov_webm_del; fi 
        if [[ "$ext" == *.ts*  ]];  then if_ts_mp4_del; fi 
        if [[ "$ext" == *.avi* ]];  then if_avi_mp4_del ; if_avi_webm_del; fi 
        if [[ "$ext" == *.mkv* ]];  then if_mkv_mp4_del; fi 
        if [[ "$ext" == *.mp4* ]];  then if_mp4_webm_del; fi 

        # exten="*$ext"
        # mv "$exten" /mnt/octo/failed_conv/

    done

  #=====[ 

}

Vid-T
