#!/bin/sh


if_avi_mkv_del () {
for f in *.avi; do
  [ -e "${f%.*}.mkv" ] && rm -rf "$f"
done

}



# if_avi_mkv_del


