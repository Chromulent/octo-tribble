#!/bin/sh

if_m4v_mkv_del () {
for f in *.m4v; do
  [ -e "${f%.*}.mkv" ] && rm -rf "$f"
done

}



# if_m4v_mkv_del
