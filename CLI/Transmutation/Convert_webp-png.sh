#!/bin/sh

for f in *.webp; do ffmpeg -i "$f" "${f%.webp}.png"; done

