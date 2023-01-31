
# function to set terminal title  
set-title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

if_m4v_mkv_del () {
for f in *.m4v; do
  [ -e "${f%.*}.mkv" ] && rm -rf "$f"
done

}

# if_m4v_mkv_del

if_mkv_mp4_del () {
for f in *.mkv; do
  [ -e "${f%.*}.mp4" ] && rm -rf "$f"
done

}

if_mp4_webm_del () {
for f in *.mp4; do
  [ -e "${f%.*}.webm" ] && rm -rf "$f"
done

}

if_avi_mp4_del () {
for f in *.avi; do
  [ -e "${f%.*}.mp4" ] && rm -rf "$f"
done

}

if_very_smol_del () {
for f in *.*; do
  fsize=$(find "$f" -printf "%s")
  if [[ "$fsize" -lt "500000"  ]] ;
    then rm -rf "$f" ; 
  fi 
done
}



for d in */ ; do
  cd "$d"
  UPDI="$(pwd | sed 's:.*/::')" 
  set-title "$UPDI"
  find . -name '*.mp4' -exec sh -c 'ffmpeg -y -i "$0" -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis "${0%%.mp4}.webm"' {} \;
  if_very_smol_del
  cd ..
done


for d in */ ; do
  cd "$d"
  find . -name '*.mkv' -exec sh -c 'ffmpeg -y -i "$0" -c:v libx264 -preset medium -c:a aac "${0%%.mkv}.mp4"' {} \;
  if_very_smol_del
  cd ..
done


for d in */ ; do
  cd "$d"
  find . -name '*.mp4' -exec sh -c 'ffmpeg -y -i "$0" -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis "${0%%.mp4}.webm"' {} \;
  if_very_smol_del
  cd ..
done


for d in */ ; do
  cd "$d"
  if_very_smol_del
  if_mkv_mp4_del
  if_avi_mp4_del
  if_mp4_webm_del
  cd ..
done



for d in */ ; do
  cd "$d"
  UPDI="$(pwd | sed 's:.*/::')" 
  set-title "$UPDI"
  if_very_smol_del
  find . -name '*.avi' -exec sh -c 'ffmpeg -y -i "$0" -x265-params crf=25 "${0%%.avi}.webm"' {} \;
  find . -name '*.mkv' -exec sh -c 'ffmpeg -y -i "$0" -c:v libx264 -preset medium -c:a aac "${0%%.mkv}.mp4"' {} \;
  find . -name '*.mp4' -exec sh -c 'ffmpeg -y -i "$0" -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis "${0%%.mp4}.webm"' {} \;
  if_very_smol_del
  cd ..
done







source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/main/Automation/Functions/Report_Videos_inDir.sh)
clear
Video_Report





############################################################################################
# Attempted re-creation of Dedupe information below
############################################################################################
# The current loop only checks to see if these files exist -- not to check their size.



confail="/mnt/OpenDrive/Videos/temp/sets/convert_fail"

if_mkv_mp4_del () {
  for f in *.mp4; do

    # Create new variable, with a modified extension
    d="$(echo "${f%.*}".mp4)"
    # check if the files exists and if it exists create a new variable that determines the size of the original file and the converted file
    [[ -f "$f" ]] && fsize=$(find "$f" -printf "%s")
    [[ -f "$d" ]] && dsize=$(find "$d" -printf "%s")
    
    # check if the original file exists -- and during the test run we will just echo if the file is under a certain size
    # check if the original file exists -- and if the the file is smaller than 5 MiB then delete the corrupt original file 
    [[ -f "$f" ]] && if [[ "$fsize" -lt "500000"  ]] ;then echo "$fsize" ; rm -rf "$f" ; fi 
    
    # check if the duplicate file exists -- and during the test run we will just echo if the file is under a certain size
    # check if the duplicate file exists -- and if the the file is smaller than 5 MiB then delete the corrupt duplicate file     
    [[ -f "$d" ]] && if [[ "$dsize" -lt "500000"  ]] ;then echo "$dsize" ; run rm -rf "$d" ; fi
    
    # check if the duplicate file exists -- and during the test run we will just echo if the file is under a certain size
    # check if the duplicate file exists -- and if the the file is larger then we start checking its length     
    [[ -f "$d" ]] && if [[ "$dsize" -gt "500000"  ]] ;then

    # check the length of the original file 
      flen="$( ffmpeg -i "$f" 2>&1 | grep -E '^ +Duration'| cut -d':' -f2- | cut -d, -f1 )"

    # check the length of the duplicate file       
      dlen="$( ffmpeg -i "$d" 2>&1 | grep -E '^ +Duration'| cut -d':' -f2- | cut -d, -f1 )"

    # using the length of the original file create 3 variables -- hour, minute, and seconds
      flenHr=$(cut -d':' -f1 <<< "$flen")
      flenHr=$(sed "s/ //g" <<< "$flenHr")
      flenMn=$(cut -d':' -f2 <<< "$flen")
      flenSc=$(cut -d':' -f3 <<< "$flen")

    # using the length of the duplicate file create 3 variables -- hour, minute, and seconds
      dlenHr=$(cut -d':' -f1 <<< "$dlen")
      dlenHr=$(sed "s/ //g" <<< "$dlenHr")
      dlenMn=$(cut -d':' -f2 <<< "$dlen")
      dlenSc=$(cut -d':' -f3 <<< "$dlen")

      # compare the original and duplicate variable lengths of hour, minute, and seconds are at least the same size or larger
      if [ $flenHr >= $dlenHr ] && [ $flenMn >= $dlenMn ] && [ $flenSc >= $dlenSc ]
        # if they are then delete the original file 
        then echo rm -rf "$f"
        # if they are not then delete the duplicate and move the original to the failed conversions folder
        else echo rm -rf "$d"; mv "$f" "$confail"
      fi

    # just to ensure that no files become duplicated during extended operational runs -- we need to unset all variables
    unset d ; unset dsize ; unset dlen
    unset dlenHr ; unset dlenMr ; unset dlenSc 
    unset fsize ; unset flen
    unset flenHr ; unset flenMr ; unset flenSc
    
  fi
  done
}
if_mkv_mp4_del




confail="/mnt/OpenDrive/Videos/temp/sets/convert_fail"

if_avi_webm_del () {
  for f in *.webm; do

    # Create new variable, with a modified extension
    d="$(echo "${f%.*}".webm)"
    # check if the files exists and if it exists create a new variable that determines the size of the original file and the converted file
    [[ -f "$f" ]] && fsize=$(find "$f" -printf "%s")
    [[ -f "$d" ]] && dsize=$(find "$d" -printf "%s")
    
    # check if the original file exists -- and during the test run we will just echo if the file is under a certain size
    # check if the original file exists -- and if the the file is smaller than 5 MiB then delete the corrupt original file 
    [[ -f "$f" ]] && if [[ "$fsize" -lt "500000"  ]] ;then echo "$fsize" ; rm -rf "$f" ; fi 
    
    # check if the duplicate file exists -- and during the test run we will just echo if the file is under a certain size
    # check if the duplicate file exists -- and if the the file is smaller than 5 MiB then delete the corrupt duplicate file     
    [[ -f "$d" ]] && if [[ "$dsize" -lt "500000"  ]] ;then echo "$dsize" ; run rm -rf "$d" ; fi
    
    # check if the duplicate file exists -- and during the test run we will just echo if the file is under a certain size
    # check if the duplicate file exists -- and if the the file is larger then we start checking its length     
    [[ -f "$d" ]] && if [[ "$dsize" -gt "500000"  ]] ;then

    # check the length of the original file 
      flen="$( ffmpeg -i "$f" 2>&1 | grep -E '^ +Duration'| cut -d':' -f2- | cut -d, -f1 )"

    # check the length of the duplicate file       
      dlen="$( ffmpeg -i "$d" 2>&1 | grep -E '^ +Duration'| cut -d':' -f2- | cut -d, -f1 )"

    # using the length of the original file create 3 variables -- hour, minute, and seconds
      flenHr=$(cut -d':' -f1 <<< "$flen")
      flenHr=$(sed "s/ //g" <<< "$flenHr")
      flenMn=$(cut -d':' -f2 <<< "$flen")
      flenSc=$(cut -d':' -f3 <<< "$flen")

    # using the length of the duplicate file create 3 variables -- hour, minute, and seconds
      dlenHr=$(cut -d':' -f1 <<< "$dlen")
      dlenHr=$(sed "s/ //g" <<< "$dlenHr")
      dlenMn=$(cut -d':' -f2 <<< "$dlen")
      dlenSc=$(cut -d':' -f3 <<< "$dlen")

      # compare the original and duplicate variable lengths of hour, minute, and seconds are at least the same size or larger
      if [ $flenHr >= $dlenHr ] && [ $flenMn >= $dlenMn ] && [ $flenSc >= $dlenSc ]
        # if they are then delete the original file 
        then echo rm -rf "$f"
        # if they are not then delete the duplicate and move the original to the failed conversions folder
        else echo rm -rf "$d"; mv "$f" "$confail"
      fi

    # just to ensure that no files become duplicated during extended operational runs -- we need to unset all variables
    unset d ; unset dsize ; unset dlen
    unset dlenHr ; unset dlenMr ; unset dlenSc 
    unset fsize ; unset flen
    unset flenHr ; unset flenMr ; unset flenSc
    
  fi
  done
}
if_avi_webm_del


