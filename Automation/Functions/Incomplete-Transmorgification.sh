#!/bin/sh


Incomplete-VidT () {

    # Define functions that we are going to be using for cleanup in later portions of our script.
    if_aac_m4a_del () {
    for f in *.aac; do
    [ -e "${f%.*}.m4a" ] && rm -rf "$f"
    done }

    if_flac_mp3_del () {
    for f in *.flac; do
    [ -e "${f%.*}.mp3" ] && rm -rf "$f"
    done }

    if_webp_png_del () {
    for f in *.webp; do
    [ -e "${f%.*}.png" ] && rm -rf "$f"
    done }

    if_3gp_mp4_del () {
    for f in *.3gp; do
    [ -e "${f%.*}.mp4" ] && rm -rf "$f"
    done }

    if_mov_webm_del () {
    for f in *.mov; do
    [ -e "${f%.*}.webm" ] && rm -rf "$f"
    done }

    if_ts_mp4_del () {
    for f in *.ts; do
    [ -e "${f%.*}.mp4" ] && rm -rf "$f"
    done }

    if_m4v_mkv_del () {
    for f in *.m4v; do
    [ -e "${f%.*}.mkv" ] && rm -rf "$f"
    done }

    if_avi_mp4_del () {
    for f in *.avi; do
    [ -e "${f%.*}.mp4" ] && rm -rf "$f"
    done }

    if_avi_webm_del () {
    for f in *.avi; do
    [ -e "${f%.*}.webm" ] && rm -rf "$f"
    done }

    if_mkv_mp4_del () {
    for f in *.mkv; do
    [ -e "${f%.*}.mp4" ] && rm -rf "$f"
    done }

    if_mp4_webm_del () {
    for f in *.mp4; do
    [ -e "${f%.*}.webm" ] && rm -rf "$f"
    done }

    if_very_smol_del () {
    for f in *.*; do
    fsize=$(find "$f" -printf "%s")
    if [[ "$fsize" -lt "500000"  ]] ;
        then rm -rf "$f" ; 
    fi 
    done }


  ## The actual point of this is to remove incomplete transmogified files
    #   Get the name of the most recently edited file
        FileModified="$( ls -t . | head -1 )"
        FileName="${FileModified%.*}"
        FileExt="${FileModified#*.}"

    #   Store a simple variable that allows us to search for all files with the same name
        st=".*"
    #   Combine the simple variable and the FileName variable to create an array with all file names with that naming schemea.
        CollectionName="$(ls $FileName$st)"
    #   To properly format this array, re-write these into another like named array.
        readarray -t CollectionOfFileName <<<"$CollectionName"

    #   For each item in this re-written array
        for n in "${CollectionOfFileName[@]}"; do
        # Get the extension for each indicies.
        SFExt="${n#*.}"
        # IF an indicies does NOT match the File Modified, the append two new variables, one for the extension and the other for the Name of the file with this new extension.
        if [[ "$n" != "$FileModified" ]];  then SourceExt="$SFExt" ; SourceFile="$FileName.$SourceExt" ; fi 
        done

    #   Create an array for the Length of the modified file
        FileModifiedLength="$( ffmpeg -i $FileModified 2>&1 | grep Duration | cut -d ' ' -f 4 | sed s/,// )"
    ##  Split this array into another new array, so that we can target the Hours, Minutes, and Seconds
        IFS=':' read -ra FMLAddr <<< "$FileModifiedLength"

    #   Create an array for the Length of the source file
        SourceFileLength="$( ffmpeg -i $SourceFile 2>&1 | grep Duration | cut -d ' ' -f 4 | sed s/,// )"
    ##  Split this array into another new array, so that we can target the Hours, Minutes, and Seconds
        IFS=':' read -ra SFLAddr <<< "$SourceFileLength"

    #   Store the hour variables for each file
        FMLHr="${FMLAddr[0]}"
        SFLHr="${SFLAddr[0]}"

    #   Store the minute variables for each file
        FMLMn="${FMLAddr[1]}"
        SFLMn="${SFLAddr[1]}"

    #   Store the Seconds variables for each file -- we will not be using this in this operation, but we could eventually.
        FMLSc="$( echo "${FMLAddr[2]}" | cut -d. -f1 )"
        SFLSc="$( echo "${SFLAddr[2]}" | cut -d. -f1 )"

    #   Test to see if the Hour variable is the samewhen compared with this source from the recently modified file.
        test ! ${SFLHr} -eq ${FMLHr} || LogicHr="True"
        test   ${SFLHr} -eq ${FMLHr} || LogicHr="False"

    #   Test to see if the Minute variable is the samewhen compared with this source from the recently modified file.
        test ! ${SFLMn} -eq ${FMLMn} || LogicMn="True"
        test   ${SFLMn} -eq ${FMLMn} || LogicMn="False"

    #   Test to see if the Second variable is the samewhen compared with this source from the recently modified file -- we will not be using this in this operation, but we could eventually.
        test ! ${SFLSc} -eq ${FMLSc} || LogicSc="True"
        test   ${SFLSc} -eq ${FMLSc} || LogicSc="False"


    #   Peform a Logic test to see if the Hours and the minutes are match the source file. 

        # if hour and minute are both true then delete the source file
        if [[ "${LogicHr}" == "True" && "${LogicMn}" == "True" ]]; then
            rm -rf "$SourceFile"
            echo "Length is correct, deleting orginal file"
        fi

        # if hour is false and minutes are true, then delete the new file
        if [[ "${LogicHr}" == "False" && "${LogicMn}" == "True" ]]; then
            rm -rf "$FileModified"
            echo "Length is incorrect, deleting transmorgified file. incorrect hour"
        fi

        # if hour is true and minutes are false, then delete the new file
        if [[ "${LogicHr}" == "True" && "${LogicMn}" == "False" ]]; then
            rm -rf "$FileModified"
            echo "Length is incorrect, deleting transmorgified file. incorrect number of minutes"
        fi

        # if hour and minute are both false then delete the new file
        if [[ "${LogicHr}" == "False" && "${LogicMn}" == "False" ]]; then
            rm -rf "$FileModified"
            echo "Length is incorrect, deleting transmorgified file."
        fi


    #   Since what ever file was causing the problem was removed, not we can run the next set of commands to clean up everything that was successfull.
        if_very_smol_del
        chmod 777 . -R
        if_aac_m4a_del 
        if_flac_mp3_del 
        if_webp_png_del 
        if_m4v_mkv_del 
        if_3gp_mp4_del 
        if_mov_webm_del 
        if_ts_mp4_del 
        if_avi_mp4_del
        if_avi_webm_del 
        if_mkv_mp4_del 
        if_mp4_webm_del 

}    

Incomplete-VidT

