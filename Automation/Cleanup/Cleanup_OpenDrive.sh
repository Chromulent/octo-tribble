#!/bin/sh

Cleanup_OpenDrive () {

	setsOpenDriveTV="/mnt/OpenDrive3/Videos/TV/"
	setsOpenDriveFilm="/mnt/OpenDrive3/Videos/Film"
	setsOpenDriveAnimated="/mnt/OpenDrive3/Videos/Animated/"
	setsOpenDriveAnime="/mnt/OpenDrive3/Videos/Anime/"

	dirPart=$(pwd)
	IFS='/'
	read -ra partPort <<< "$dirPart"

	serName="$(echo "${partPort[-1]}")"

	echo "What directory are we targeting in OpenDrive?"

	read sets

	case "$sets" in
		"tv")        dirFull=${setsOpenDriveTV}${serName};;
		"film")      dirFull=${setsOpenDriveFilm};;
		"animated")  dirFull=${setsOpenDriveAnimated}${serName};;
		"anime")     dirFull=${setsOpenDriveAnime}${serName};;
		#"animated") dirFull=${setsOpenDrive}${serName};;
	esac

	[ ! -d "$dirFull" ] && mkdir "${dirFull}"

	m4varray="$(find . -name '*.m4v')"; 
	mkvarray="$(find . -name '*.mkv')"; 
	mp4array="$(find . -name '*.mp4')"; 
	aviarray="$(find . -name '*.avi')"; 
	webmarray="$(find . -name '*.webm')"; 	

	if [ ${#m4varray[@]} -gt 0 ]; then find . -type f -name "*.m4v" -exec mv {} "${dirPart}" \;; fi
	if [ ${#mkvarray[@]} -gt 0 ]; then find . -type f -name "*.mkv" -exec mv {} "${dirPart}" \;; fi
	if [ ${#mp4array[@]} -gt 0 ]; then find . -type f -name "*.mp4" -exec mv {} "${dirPart}" \;; fi
	if [ ${#aviarray[@]} -gt 0 ]; then find . -type f -name "*.avi" -exec mv {} "${dirPart}" \;; fi
	if [ ${#webmarray[@]} -gt 0 ]; then find . -type f -name "*.webm" -exec mv {} "${dirPart}" \;; fi

	# remove all possible files that are with all possible subfolders
	find . -mindepth 1 -type f -name "*.sub" -exec rm -rf {} \; 
	find . -mindepth 1 -type f -name "*.idx" -exec rm -rf {} \; 
	find . -mindepth 1 -type f -name "*.srt" -exec rm -rf {} \; 
	find . -mindepth 1 -type f -name "*.txt" -exec rm -rf {} \; 
	find . -mindepth 1 -type f -name "*.exe" -exec rm -rf {} \; 
	find . -mindepth 1 -type f -name "*.jpg" -exec rm -rf {} \; 
	find . -mindepth 1 -type f -name "*.nfo" -exec rm -rf {} \; 

	# delete all empty folders within the directory that we are performing this action within 
	find . -empty -type d -delete

	clear

	if [ ${#m4varray[@]} -gt 0 ]; then mv *.m4v "${dirFull}" ; fi
	if [ ${#mkvarray[@]} -gt 0 ]; then mv *.mkv "${dirFull}" ; fi
	if [ ${#mp4array[@]} -gt 0 ]; then mv *.mp4 "${dirFull}" ; fi
	if [ ${#aviarray[@]} -gt 0 ]; then mv *.avi "${dirFull}" ; fi
	if [ ${#webmarray[@]} -gt 0 ]; then mv *.webm "${dirFull}" ; fi

}

Cleanup_OpenDrive

