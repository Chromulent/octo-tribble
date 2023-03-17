#!/bin/sh

False_Stop_Clear () {


	clear
	party="$(find . -type f -not -path '*/[@.]*' -printf "\n%T@\t%AD %AT %p" | sort -r | cut -d$'\t' -f2- | head -n1)"
	part="$(echo $party | cut -d " " -f2-)"
	pRT="$(echo $part | cut -d " " -f2-)"
	fileremains="$(echo $pRT | cut -c3- )"
	thisdir="$(pwd)"

	numTS="$(find . -mindepth 1 -type f -name "*.ts" -exec printf x \; | wc -c)"
	numM4V="$(find . -mindepth 1 -type f -name "*.m4v" -exec printf x \; | wc -c)"
	numMP4="$(find . -mindepth 1 -type f -name "*.mp4" -exec printf x \; | wc -c)"
	numWAV="$(find . -mindepth 1 -type f -name "*.wav" -exec printf x \; | wc -c)"
	numMKV="$(find . -mindepth 1 -type f -name "*.mkv" -exec printf x \; | wc -c)"
	numAVI="$(find . -mindepth 1 -type f -name "*.avi" -exec printf x \; | wc -c)"

	if [[  "$numTS" -gt "0" || "$numWAV" -gt "0" || "$numAVI" -gt "0" ||"$numMKV" -gt "0" ||"$numM4V" -gt "0" ||"$numMP4" -gt "0" ]]
	then
		clear
		echo "y or n"
		echo ""
		echo "Do you want to delete $fileremains from $thisdir ?"

		read answer

		case "$answer" in 
		"y") rm "$fileremains" ;;
		"n") echo "not deleting $fileremains from $thisdir" ;;	
		esac

	else
		echo "No need to run this command!"
	fi

}


False_Stop_Clear