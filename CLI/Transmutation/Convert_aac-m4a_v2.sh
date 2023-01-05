#!/bin/sh


for f in *.aac; do ffmpeg -i "$f"  -codec: copy "${f%.aac}.m4a"; done

