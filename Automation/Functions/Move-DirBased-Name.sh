#!/bin/sh

move_dirBased () {
        for i in *;do   
          if    
          [[ "$i" == *"${x}"* ]];then   
          n="$(echo "${i}" | xargs)"   
          mv "$i" "$n"   
          o=$p$n   
          mv "$i" "$o"   
          fi
        done
}

# Move file based on a directory
# move_dirBased