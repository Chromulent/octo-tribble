#!/bin/sh


if_webm_mp4_del () {
for f in *.webm; do
  [ -e "${f%.*}.mp4" ] && rm -rf "$f"
done

}


# if_webm_mp4_del
