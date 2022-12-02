#!/bin/sh

double_RUS () {
	for i in *;do
	  if 
	  [[ "$i" == *"  "* ]];then
	  sudo rename "s/  / /g" "$i"
	  fi
	done
}

# double_RUS