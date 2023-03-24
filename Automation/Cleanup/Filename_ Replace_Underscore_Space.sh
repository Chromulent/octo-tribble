#!/bin/sh

RUS_command () {
  for i in *;do
    if 
    [[ "$i" == *"_"* ]];then
    sudo rename "s/_/ /g" "$i"
    fi
  done
}

RUS_command
