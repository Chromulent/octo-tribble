#!/bin/sh

# Old function
# if_avi_webm_del () {
# for f in *.avi; do
#  [ -e "${f%.*}.webm" ] && rm -rf "$f"
#done
# }


if_avi_webm_del () {
  for f in *.avi; do
    d="$(echo "${f%.*}".webm)"
    [[ -f "$f" ]] && fsize=$(find "$f" -printf "%s") && if [[ "$fsize" -lt "500000"  ]] ;then rm -rf "$f" ; fi 
    [[ -f "$d" ]] && dsize=$(find "$d" -printf "%s") && if [[ "$dsize" -lt "500000"  ]] ;then rm -rf "$d" ; fi
    [ -e "${f%.*}.webm" ] && rm -rf "$f"
  done
 }



# if_avi_webm_del


