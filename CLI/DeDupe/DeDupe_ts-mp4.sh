#!/bin/sh

if_ts_mp4_del () {
for f in *.ts; do
  [ -e "${f%.*}.mp4" ] && rm -rf "$f"
done

}

# if_ts_mp4_del

