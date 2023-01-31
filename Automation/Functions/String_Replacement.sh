#!/bin/sh

# Variable

# cd '/mnt/OpenDrive/Videos/Creators'

string_replacement () {
        for i in *;do
          if 
          [[ "$i" == *"${k}"* ]];then
          rename "s/${k}/${l}/g" "$i"
          fi
        done
}

# String you want repalced
# k=""
# String that will replace it
# l=""
# string_replacement