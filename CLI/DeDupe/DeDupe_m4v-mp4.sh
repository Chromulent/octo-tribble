#!/bin/sh

if_m4v_mp4_del () {
for f in *.m4v; do
  [ -e "${f%.*}.mp4" ] && rm -rf "$f"
done

}



# if_m4v_mp4_del