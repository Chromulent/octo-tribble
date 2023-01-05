#!/bin/sh


if_aac_m4a_del () {
for f in *.aac; do
  [ -e "${f%.*}.m4a" ] && rm -rf "$f"
done

}

# if_aac_m4a_del

