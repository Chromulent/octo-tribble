#!/bin/sh


if_webp_png_del () {
for f in *.webp; do
  [ -e "${f%.*}.png" ] && rm -rf "$f"
done

}

# if_webp_png_del

