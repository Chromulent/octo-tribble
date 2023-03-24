#!/bin/sh

Directory_FileName_Purge () {
	for i in *;do
	  if 
	  UPDI="$(pwd | sed 's:.*/::')" 
	  [[ "$i" == *"$UPDI"* ]];then
	  sudo rename "s/$UPDI/ /g" "$i"
	  fi
	done
}

Directory_FileName_Purge

