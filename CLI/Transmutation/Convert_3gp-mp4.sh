#!/bin/sh

find . -name '*.3gp' -exec sh -c 'ffmpeg -y -i "$0" -c:v copy -c:a copy "${0%%.3gp}.mp4"' {} \;

