#!/bin/sh

Split_Dir_Number () {
  echo How many files in each folder?
  read skr
  n=0 
  for file in *; do 
      [ "$n" = "$skr" ] && n=0
      mkdir -p folder"$n"
      mv -- "$file" "folder_$n"
      n=$((n+1))
  done
}

# Split_Dir_Number 