#!/bin/sh

if_mp4_webm_del () {
for f in *.mp4; do
  [ -e "${f%.*}.webm" ] && rm -rf "$f"
done

}


# if_mp4_webm_del

