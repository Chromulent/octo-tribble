#!/bin/sh

for f in *.flac; do ffmpeg -i "$f" -acodec libmp3lame -ab 128k "${f%.flac}.mp3"; done

