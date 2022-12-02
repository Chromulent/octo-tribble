#!/bin/sh

Extra_DOT () {
	for i in *;do
	  if 
	  [[ "$i" == *"....."* ]];then rename "s/\.+/./g" "$i"
	  [[ "$i" == *"...."* ]];then rename "s/\.+/./g" "$i"
	  [[ "$i" == *"..."* ]];then rename "s/\.+/./g" "$i"
	  [[ "$i" == *".."* ]];then rename "s/\.+/./g" "$i"
	  #[[ "$i" == *"   "* ]];then rename "s/\.+/./g" "$i"
	  fi
	done
}

# Extra_DOT