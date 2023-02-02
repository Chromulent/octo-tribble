#!/bin/sh

Report_Size_Ext () {
  echo What Extension are we searching for today?
  read ext
  shopt -s globstar
  extTotal=$(du -sch **/*."$ext" | tail -1)
  extTotal=$(echo "$extTotal" | cut -d' ' -f1)
  echo "$ext total : $extTotal"

}

# Report_Size_Ext 