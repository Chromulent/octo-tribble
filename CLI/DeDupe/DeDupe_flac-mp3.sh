#!/bin/sh


if_flac_mp3_del () {
for f in *.flac; do
  [ -e "${f%.*}.mp3" ] && rm -rf "$f"
done

}

# if_flac_mp3_del


