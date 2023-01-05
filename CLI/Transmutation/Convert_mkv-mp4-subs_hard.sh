#!/bin/sh

# MKV to MP4 Subs ?
# ffmpeg -i input.mkv -map 0 -c:v libx264 -c:a aac -c:s mov_text -metadata:s:s:0 language=eng -metadata:s:s:1 language=ipk output.mp4

# MKV to MP4 Hard Subs
# ffmpeg -i input.mkv -vf subtitles=input.mkv output.mp4

for f in *.mkv; do ffmpeg -i "$f"  -vf subtitles=input.mkv "${f%.mkv}.mp4"; done
