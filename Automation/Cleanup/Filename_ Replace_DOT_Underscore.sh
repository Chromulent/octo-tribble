#!/bin/sh

DOT_Space () {
	for f in *.*;do 
	  pre="${f%.*}";
    suf="${f##*.}";
	  mv -i -- "$f" "${pre//./_}.${suf}";
	done
}

DOT_Space