#!/bin/sh

for f in *.mkv; do ffmpeg -i "$f" -map 0:v -c:a aac -c:v copy "${f%.mkv}.mp4"; done
