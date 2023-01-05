#!/bin/sh

find . -name '*.m4v' -exec sh -c 'ffmpeg -y -i "$0" -c:v copy -c:a copy  "${0%%.m4v}.mkv"' {} \;

