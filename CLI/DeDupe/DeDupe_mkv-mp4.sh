#!/bin/sh

if_mkv_mp4_del () {
for f in *.mkv; do
  [ -e "${f%.*}.mp4" ] && rm -rf "$f"
done

}

# if_mkv_mp4_del

