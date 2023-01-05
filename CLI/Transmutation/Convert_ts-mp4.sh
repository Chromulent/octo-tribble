#!/bin/sh

find . -name '*.ts' -exec sh -c 'ffmpeg -i "$0" "${0%%.mp4}.mp4"' {} \;

