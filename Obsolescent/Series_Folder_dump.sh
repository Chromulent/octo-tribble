#!/bin/sh

echo What is the directory that is the base name?

read varname
sleep 3

#   Define Functions -- Remote Execution -- Add Leaading Zeros
source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/main/Automation/Cleanup/Filename_AddLeadingZero.sh)

#	Define Static Variables
store_01='for k in * ; do mv -- "$k" "'
store_03=' E$k" ; done'
setsTV='/mnt/OpenDrive/Videos/temp/sets/TV/'

#	Create Transmorgific variables
##  Remove _Season_ from varname and define this as NewDir1
NewDir1=${varname//_Season_/}
##  Replace underscores with spaces in NewDir1 and name this NewDir
NewDir="$( echo $NewDir1 | tr '_' ' ' )"
##  Combine root directory with the naming scheme for collected varname to define new directory, variable named movPlc, short for MovePlace
movPlc="${setsTV}${NewDir}"

#	Define Array, look for all directories within the current one that have the same naming scheme and add these to the array
varArr="$( find . -name "*$varname*" -type d -printf '%f\n' )"
#	Declare array
declare -p varArr

#   First Action, create new directory for all files herein to be moved to
mkdir "$movPlc"

for i in ${varArr[@]}; do
#  Create Variables based on the directories stored within the array
## Remove varname from the directory, leaving the season number, a underscore and aroundabout year the season was produced
   FOO=${i//$varname/}
## Rip the season string by splitting FOO into just the season number   
   num=$(cut -d'_' -f1 <<< "$FOO")
## Rip the season string by splitting FOO into just the aroundabout year the season was produced   
   suff=$(cut -d'_' -f2 <<< "$FOO")
## Create variable with S for Season, a Zero and the num variable. (This for is assumed for series with less than 10 seasons)   
   n="S0$num"
## Create variable with pieces of pre-written shell to attempt to run a command with a variable that is dynamically created.
   w="$store_01$n$store_03"
## See if we can path to the specific folder with the content that we will begin moving.
   cd $i
#  Rename and move Files
##  Here we will add zeros to single digit filenames that are numeric, this just adds an empty zero, to ensure proper play through
   Add_Leading_Zero_Double-Digit ; sleep 3
## run stored variable as command -- this simply adds S0# E filename to the existing filename
   bash -c "$w"   
## After all files are renamed, move the proper directory
   mv *.mkv *.mp4 *.m4v *.avi *.webm "$movPlc" ; sleep 3
## Move back to the main directory
   cd ..
## Finally delete the directory
   rmdir "$i"

done

