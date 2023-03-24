#!/bin/sh

triple_RUS () {
	for i in *;do
	  if 
	  [[ "$i" == *"   "* ]];then
	  sudo rename "s/   / /g" "$i"
	  fi
	done
}

# triple_RUS 