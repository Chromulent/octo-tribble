#!/bin/sh

find . -name '*.avi' -exec sh -c 'ffmpeg -i "$0" -x265-params crf=25 "${0%%.avi}.webm"' {} \;

