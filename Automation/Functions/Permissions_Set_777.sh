#!/bin/sh

# Set permissions on all files in this directory to meet the stanard that we are looking for
for d in ./*/
do
  cd "$d"
  chmod -R 777 .
  #cd ..
done

