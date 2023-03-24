#!/bin/sh

# Remove trailing and leading white space at the start and end of files
for i in *;do
  if 
    [[ "$i" == *"$i"* ]];then
    p="$(echo "${i}" | xargs)"
    mv -f "$i" "$p"
  fi
done

RUS_command 