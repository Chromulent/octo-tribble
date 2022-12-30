#!/bin/sh


Add_Leading_Zero_Double-Digit () {
	for f in *; do
      fil="${f%.*}"
	  if [ "$fil" -le "9" ]; then
	  c="0${f}"
	  mv $f $c
	  fi
	done
}

