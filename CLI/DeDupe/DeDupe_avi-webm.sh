#!/bin/sh


if_avi_webm_del () {
for f in *.avi; do
  [ -e "${f%.*}.webm" ] && rm -rf "$f"
done

}



# if_avi_webm_del

