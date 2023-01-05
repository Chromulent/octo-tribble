#!/bin/sh

# MKV to MP4 Subs ?
# ffmpeg -i input.mkv -map 0 -c:v libx264 -c:a aac -c:s mov_text -metadata:s:s:0 language=eng -metadata:s:s:1 language=ipk output.mp4

# MKV to MP4 Soft Subs
# ffmpeg -i input.mkv -c copy -c:s mov_text output.mp4

for f in *.mkv; do ffmpeg -i "$f" -c copy -c:s mov_text "${f%.mkv}.mp4"; done
