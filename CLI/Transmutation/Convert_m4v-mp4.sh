#!/bin/sh

find . -name '*.m4v' -exec sh -c 'ffmpeg -y -i "$0" -c copy "${0%%.m4v}.mp4"' {} \;
