#!/bin/sh


if_3gp_mp4_del () {
for f in *.3gp; do
  [ -e "${f%.*}.mp4" ] && rm -rf "$f"
done

}

# if_3gp_mp4_del

