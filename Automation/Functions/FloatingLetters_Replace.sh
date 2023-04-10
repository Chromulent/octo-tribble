#!/bin/sh

FloatingLetters_Replace () {

	source <(curl -L https://raw.githubusercontent.com/Chromulent/octo-tribble/main/Automation/Functions/String_Replacement.sh)

	k=" -s"
	l="s"
	string_replacement

	k="_s"
	string_replacement

	k=" s"
	string_replacement

	k=" -m"
	l="m"
	string_replacement

	k="_m"
	string_replacement

	k=" m"
	string_replacement

	k=" -t"
	l="t"
	string_replacement

	k="_t"
	string_replacement

	k=" t"
	string_replacement	

}



