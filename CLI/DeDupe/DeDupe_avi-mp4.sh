#!/bin/sh


if_avi_mp4_del () {
for f in *.avi; do
  [ -e "${f%.*}.mp4" ] && rm -rf "$f"
done

}



# if_avi_mp4_del


