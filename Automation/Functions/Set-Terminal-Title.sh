#!/bin/sh

# function to set terminal title  
set-title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

# If you want the Directory
# UPDI="$(pwd | sed 's:.*/::')" 

# set-title "$UPDI"

