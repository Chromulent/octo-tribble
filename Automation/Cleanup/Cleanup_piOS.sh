#!/bin/sh

Cleanup_piOS () {

	## Move all of a specific extension to the main directory -- This will help with series clean up
	find . -mindepth 1 -type f -name "*.m4v" -exec mv {} . \; 
	find . -mindepth 1 -type f -name "*.mkv" -exec mv {} . \; 
	find . -mindepth 1 -type f -name "*.mp4" -exec mv {} . \; 
	find . -mindepth 1 -type f -name "*.avi" -exec mv {} . \; 


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

}

Cleanup_piOS
