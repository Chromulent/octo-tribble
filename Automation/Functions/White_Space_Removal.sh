#!/bin/sh

White_Space_Removal () {

	for i in *;do
	  if 
	    [[ "$i" == *"$i"* ]];then
	    p="$(echo "${i}" | xargs)"
	    mv -f "$i" "$p"
	  fi
	done

}

