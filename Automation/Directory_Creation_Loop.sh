#!/bin/sh

KeepLoopin=true
while $KeepLoopin; do
	echo "What is the name of the directory that you would like to create?"
	read NoMan
	mkdir "$NoMan"

	sleep 1
	echo "Do you wish to continue creating directories?"
	select yn in "Yes" "No"; do
    	case $yn in
        	Yes ) KeepLoopin=true ; clear ; break;;
        	No )  KeepLoopin=false ; break;;
    	esac
	done

done

