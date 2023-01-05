#!/bin/sh



if_webm_mkv_del () {
for f in *.webm; do
  [ -e "${f%.*}.mkv" ] && rm -rf "$f"
done

}


# if_webm_mkv_del


