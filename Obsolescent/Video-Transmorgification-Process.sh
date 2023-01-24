#!/bin/sh

# Later daniel Note: if this is used, you might be able to dynamicially add or remove which functions can be called on by either defining them, 
# or by a simple bashing out of those that are not needed.

## Either way, this method can DRAMATICALLY simplify all work done as all work will become unified under this thought process instead of 
### manual commands done with no check on its own reduducnancy and does not rely on human memory.

# Store the remote calls here and store transmorgification commands as functions conv_to_()

source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/blob/main/CLI/DeDupe/DeDupe_flac-mp3.sh)
source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/blob/main/CLI/DeDupe/DeDupe_webp-png.sh)
source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/blob/main/CLI/DeDupe/DeDupe_ts-mp4.sh)
source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/blob/main/CLI/DeDupe/DeDupe_avi-mp4.sh)
source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/blob/main/CLI/DeDupe/DeDupe_avi-webm.sh)
source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/blob/main/CLI/DeDupe/DeDupe_m4v-mkv.sh)
source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/main/CLI/DeDupe/DeDupe_mkv-mp4.sh)
source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/blob/main/CLI/DeDupe/DeDupe_mp4-webm.sh)

# conv_to_aac_from_m4a () { for f in '*.aac'; do ffmpeg -i "$f"  -codec: copy "${f%.aac}.m4a"; done }
# conv_to_avi_from_mp4 () { find . -name '*.avi' -exec sh -c 'ffmpeg -y -i "$0" -x265-params crf=25 "${0%%.avi}.mp4"' {} \; }
# conv_to_avi_from_webm () { find . -name '*.avi' -exec sh -c 'ffmpeg -y -i "$0" -x265-params crf=25 "${0%%.avi}.webm"' {} \; }
# conv_to_flac_from_mp3 () { for f in '*.flac'; do ffmpeg -i "$f" -acodec libmp3lame -ab 128k "${f%.flac}.mp3"; done }
# conv_to_m4v_from_mkv () { find . -name '*.m4v' -exec sh -c 'ffmpeg -y -i "$0" -c:v copy -c:a copy  "${0%%.m4v}.mkv"' {} \; }
# conv_to_mkv_from_mp4_subs_hard () { for f in *.mkv; do ffmpeg -i "$f"  -vf subtitles=input.mkv "${f%.mkv}.mp4"; done }
# conv_to_mkv_from_mp4_subs_soft () { for f in *.mkv; do ffmpeg -i "$f" -c copy -c:s mov_text "${f%.mkv}.mp4"; done }
# conv_to_mkv_from_mp4 () { for f in *.mkv; do ffmpeg -i "$f" -c copy "${f%.mkv}.mp4"; done }
# conv_to_mp4_from_webm () { find . -name '*.mp4' -exec sh -c 'ffmpeg -i "$0" -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis "${0%%.mp4}.webm"' {} \; }
# conv_to_ts_from_mp4 () { find . -name '*.ts' -exec sh -c 'ffmpeg -i "$0" "${0%%.mp4}.mp4"' {} \; }
# conv_to_webp_from_png () { for f in *.webp; do ffmpeg -i "$f" "${f%.webp}.png"; done }

conv_to_aac_from_m4a () {           ffmpeg -y -i "$opVal" -codec: copy "${opVal%.aac}.m4a"; }
conv_to_avi_from_mp4 () {           ffmpeg -y -i "$opVal" -x265-params crf=25 "${opVal%.avi}.mp4"; }
conv_to_avi_from_webm () {          ffmpeg -y -i "$opVal" -x265-params crf=25 "${opVal%.avi}.webm"; }
conv_to_flac_from_mp3 () {          ffmpeg -y -i "$opVal" -acodec libmp3lame -ab 128k "${opVal%.flac}.mp3"; }
conv_to_m4v_from_mkv () {           ffmpeg -y -i "$opVal" -c:v copy -c:a copy  "${opVal%.m4v}.mkv" }
conv_to_mkv_from_mp4_subs_hard () { ffmpeg -y -i "$opVal" -vf subtitles=input.mkv "${opVal%.mkv}.mp4"; }
conv_to_mkv_from_mp4_subs_soft () { ffmpeg -y -i "$opVal" -c copy -c:s mov_text "${opVal%.mkv}.mp4"; }
conv_to_mkv_from_mp4 () {           ffmpeg -y -i "$opVal" -c copy "${opVal%.mkv}.mp4"; }
conv_to_mp4_from_webm () {          ffmpeg -y -i "$opVal" -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis "${opVal%.mp4}.webm"; }
conv_to_ts_from_mp4 () {            ffmpeg -y -i "$opVal" "${opVal%.mp4}.mp4"; }
conv_to_webp_from_png () {          ffmpeg -y -i "$opVal" "${opVal%.webp}.png"; }

# store file type array here, .ts, avi, m4v, mkv, etc..


extArray=(
  # "aac "
  # "flac"  
  # "webp" 
  "avi"
  "m4v"
  "ts"
  "mkv"
  "mp4"
  "webm"
  # ""
)

# If .EXT is not .WEBM then --> Content pair with remote call function to run said command against. 

### delete previous array here
### define new array here

## spefically if .EXT is not .WEBM then store all of .EXT file type within array - gather FULL PATH name

## for each item within this defined array, do the following: 


# using remote call functions of transmorgification create a switch like powershell object (or find how to use or mimic) based on extension that is defined.
## if .EXT is .EXT then do convert .EXT to Y
## if .EXT1 is .EXT1 then do convert .EXT1 to Z



for ext in ${extArray[@]}; do
  ext=".$ext"
  numExt="$(find . -mindepth 1 -type f -name "*$ext" -exec printf x \; | wc -c)"
  unset opArr
  opArr="$( find . -mindepth 1 -type f -name "*$ext" )"
  declare -p opArr

	if [[ "$ext" == *.aac* ]];    then ffmpeg -y - i "$opVal" -codec: copy "${opVal%.*}.m4a"; fi 
	if [[ "$ext" == *.flac* ]];   then ffmpeg -y -i "$opVal" -acodec libmp3lame -ab 128k "${opVal%.*}.mp3"; fi 
	if [[ "$ext" == *.webp* ]];   then ffmpeg -y -i "$opVal" "${opVal%.*}.png"; fi 
	if [[ "$ext" == *.m4v* ]];    then ffmpeg -y -i "$opVal" -c:v copy -c:a copy  "${opVal%.*}.mkv"; fi 
	if [[ "$ext" == *.ts* ]];     then ffmpeg -y -i "$opVal" "${opVal%.*}.mp4"; fi   
	if [[ "$ext" == *.avi* ]];    then ffmpeg -y -i "$opVal" -x265-params crf=25 "${opVal%.*}.webm"; fi 
	if [[ "$ext" == *.mkv* ]];    then ffmpeg -y -i "$opVal" -c copy "${opVal%.*}.mp4"; fi 
	# if [[ "$ext" == *.mkv* ]];  then ffmpeg -y -i "$opVal" -vf subtitles=input.mkv "${opVal%.*}.mp4"; fi 
	# if [[ "$ext" == *.mkv* ]];  then ffmpeg -y -i "$opVal" -c copy -c:s mov_text "${opVal%.*}.mp4"; fi 
	if [[ "$ext" == *.mp4* ]];    then ffmpeg -y -i "$opVal" -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis "${opVal%.*}.webm"; fi 

  if [[ "$ext" == *.aac* ]];  then if_aac_m4a_del; fi 
  if [[ "$ext" == *.flac* ]]; then if_flac_mp3_del; fi 
  if [[ "$ext" == *.webp* ]]; then if_webp_png_del; fi 
  if [[ "$ext" == *.m4v* ]];  then if_m4v_mkv_del; fi 
  if [[ "$ext" == *.ts* ]];   then if_ts_mp4_del; fi 
  if [[ "$ext" == *.avi* ]];  then if_avi_mp4_del ; if_avi_webm_del; fi 
  if [[ "$ext" == *.mkv* ]];  then if_mkv_mp4_del; fi 
  if [[ "$ext" == *.mp4* ]];  then if_mp4_webm_del; fi 
  # if [[ "$ext" == *.webm* ]]; then ; fi 
  # if [[ "$ext" == *"."* ]]; then ; fi 
done



workArr=()

for ext in ${extArray[@]}; do
  ext=".$ext"
  numExt="$(find . -mindepth 1 -type f -name "*$ext" -exec printf x \; | wc -c)"
  sleep 3s
  if (( $numExt > 0 )); then opArr="$( find . -mindepth 1 -type f -name "*$ext" )"; fi
  workArr+=("${opArr[@]}")
done







for ext in ${extArray[@]}; do
 ext=".$ext"

  # For every file
  for i in *;do
    ## If the file contains the adjusted indicies then remove ' String'
    if [[ "$i" == *"$iwaSPA"* ]]; then rename "s/$iwaSPA//g" "$i"; fi 
    ## If the file contains the adjusted indicies then remove 'String' 
    if [[ "$i" == *"$iwaVAR"* ]]; then rename "s/$iwaVAR//g" "$i"; fi 
  done

done






#####   Finish array
##      Loop array for all file types if they exist
## ? Maybe instead of looping through we can all instances?
## Another Maybe we can add all completed files to a chain to then re-interate over and ensure that all files are set to the final version?




# run if_smol_del here against the root array

# get all file types for all folders in all root directories. 

### if not those defined in the file type array then do not add to the dedupe array


## if_new_del_old -- if new kind of file type exists here, then we can del the old. (only for those within the array)







# If NOT WEBM then move to failed conversion folder (will define)




# IF WEBM then move full name to new path based on root folder to move all files except for tv files, these need to have an exception created for them to
# move them and their directories to the proper location.




