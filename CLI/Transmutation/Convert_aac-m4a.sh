#!/bin/sh


find . -name '*.aac' -exec sh -c 'ffmpeg -i "$0" -codec: copy "${0%%.aac}.m4a"' {} \;

