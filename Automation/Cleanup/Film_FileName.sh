#!/bin/sh

#   Define array and seperate up by common elements found in most file names
cArray=( # Resolution
  "480p"
  "720p"
  "1080p"
  "2160p"
  "480P"
  "720P"
  "1080P"
  "2160P" 
  "480"
  "720"
  "1080"
  "2160"
  "4k"
  "4K"
  # Source
  "AMZN"
  "BDrip"
  "BRrip"
  "BluRay"
  "Bluray "
  "Bluray-002"
  "bluray"
  "DVD"
  "DVDScr"
  "HDRip"
  "HDR" 
  "HDTV"
  "HULU"
  "WEB"
  "web"
  "WEB-DL"
  "WEBDL"
  "WEBRip"
  "REMUX"
  "XviD"
  "bdrip"
  "BR"
  "DC"
  "TELESYNC"
  "TrueHD"
  "internal"
  # Encoding
  "5.1CH"
  "51CH"
  "5.1"
  "CPG"
  "FLAC"
  "HD-TS"
  "WEB.H  "
  "YTS.AM "
  "x264"
  "x265"
  "264"
  "265"
  "H.264"
  "H.265"
  "h264"
  "h265"
  # Codec
  "1.H"
  "10bit"
  "5.1"
  "7.1"
  "6CH"
  "8CH"
  "AAC"
  "AAC5"
  "AC3"
  "Atmos"
  "DDP5.1.H"
  "DDP"
  "FS97"
  "HEVC-PSA"
  "q22"
  "q22"
  "x260bit"
  "UHD"
  "S95"
  "EVC"
  "DTS-D"
  "MA"
  # Conditional Operators
  "Extended"  
  "EXTENDEUT"
  "THEATRICAL"
  "Upscaled"
  "ENG"
  "GRE"
  "PROPER"
  "Proper"
  "proper"
  # Uploader
  "800MB"
  "B4ND1T69"
  "BAE"
  "Bandi"  
  "BDPLEX"
  "BOKUTOX"
  "BONE"
  "DEPTH"
  "DMT"
  "DTS-JYK"
  "DV"
  "DeceitYIFY"
  "ETRG"
  "EVO"
  "GAZ"
  "GalaxyRG"
  "Ganool"
  "Joy"
  "Judas"
  "MkvCage.com"
  "MkvCage"
  "NTG"
  "PECULATE"
  "RARBG"
  "VPPV"
  "VXT"
  "VoXHD"
  "YIFY"
  "YTS.LT"
  "YTS.MX"
  "YTSAM"
  "cinecalidad.to"
  "glhf"
  "iDiOTS"
  "sample"
  "spark"
  "ION10"
  "NTb"
  "XViD"
  "FiDELiO"
  "FGT"
  "ShAaNi"
  "RESTERED"
  "ggez"
  "BAE"
)

#   Define array of Omission indicies word list
iWordArray=( "Br"
  "Rip"
  "Scr"
  "dual"
  "Soup"
  "terminal"
)

#   Define array of Omission indicies Dot list
iDotArray=(  "ws"
  "com"
  "uhd"
  "Br"
  "Br"
  "Rip"
  "Scr"
  "lat"
  "dual"
  "Soup"
  "terminal"

)

#   Define array of Omission indicies that are speciality
iOmitArray=( " 2-"
#  ""

)



#####===[ Define Functions
#########################################################################################################

## Test if dirve is mounted
source <(curl -L https://gist.githubusercontent.com/Chromulent/17898dfe37d3dfa823e111a333ecde61/raw/3e8402cb18df3c4227a83ba890c2da09b29b87e3/Fn_Mount_Drive_Test.sh)

## Replace Underscores in file names with Spaces
source <(curl -L https://gist.githubusercontent.com/Chromulent/8ce9f4080e098b76bff807f501770fc5/raw/e35e2fc2492e87850de95d9ad530b4cbfaf41c5a/Fn_Remove_Underscore.sh)

## Replace spaces in file names
source <(curl -L https://gist.githubusercontent.com/Chromulent/c165809f2cb76850ba7e6787b7184722/raw/0b43995bf7113901c344232d7a78d0100e16b08e/double_RUS.sh)
source <(curl -L https://gist.githubusercontent.com/Chromulent/26d080cd3de80a57fdcbb8c16081a8ee/raw/fa8f6b2537a4082e18914a7bdc5a6b898e9ff06c/triple_RUS.sh)

## Replace periods with Underscores
source <(curl -L https://gist.githubusercontent.com/Chromulent/22b32b1d537a1c47a19b4f67fd9e3cfe/raw/80567d32b31d72a29a9755c90acb41eb7bde5a33/Fn_Replace_Periods_UnderScore.sh)

## Replace Extra Periods with spaces
source <(curl -L https://gist.githubusercontent.com/Chromulent/716518b976eaa5c12891b5d62f6e3375/raw/da1ecb3b765fd5f8c54f212156b3888831739953/Fn_Replace_Extra_Periods.sh)

#####===[ Prerequisites
#########################################################################################################

##  Mount Drive
#	If the drive is not mounted then mount it, if it is ignore
{
    if is_mounted "/mnt/OpenDrive"; then
        echo "/mnt/OpenDrive already mounted"
        sleep 2
        clear
    else
        mount -t nfs 192.168.1.191:/mnt/user/OpenDrive /mnt/OpenDrive
        clear
    fi
}


#   Make sure that the path
cd /mnt/OpenDrive/Videos/Film

#####===[ Preform the cleanup
#########################################################################################################

##  Loop through the array adjusting each indices through concatenation and prefixing the indicies with common delimiters
for str in ${cArray[@]}; do
  strDOT=".$str"
  strHYP="-$str"
  strSPA=" $str"
  strUND="_$str"
  strVAR="$str"
  # For every file
  for i in *;do
    ## If the file contains the adjusted indicies then remove '.String'
    if [[ "$i" == *"$strDOT"* ]]; then rename "s/$strDOT//g" "$i"; fi
    ## If the file contains the adjusted indicies then remove '-String'
    if [[ "$i" == *"$strHYP"* ]]; then rename "s/$strHYP//g" "$i"; fi
    ## If the file contains the adjusted indicies then remove ' String'
    if [[ "$i" == *"$strSPA"* ]]; then rename "s/$strSPA//g" "$i"; fi
    ## If the file contains the adjusted indicies then remove '_String'
    if [[ "$i" == *"$strUND"* ]]; then rename "s/$strUND//g" "$i"; fi
    ## If the file contains the adjusted indicies then remove 'String'
    if [[ "$i" == *"$strVAR"* ]]; then rename "s/$strVAR//g" "$i"; fi    
  done
  
  for i in *;do
    ## If the filename contains parentheses then remove
    if [[ "$i" == *'('*')'* ]]; then rename 's/\(|\[|\]|\)//g' *; fi
    ## If the filename contains brackets then remove
    if [[ "$i" == *'['*']'* ]]; then rename 's/\(|\[|\]|\)//g' *; fi    
  done  

done


##  Loop through the array adjusting each indices through concatenation, removing the indicies entirely
for iwa in ${iWordArray[@]}; do
  iwaSPA=" $iwa "
  iwaVAR="$iwa"
  # For every file
  for i in *;do
    ## If the file contains the adjusted indicies then remove ' String'
    if [[ "$i" == *"$iwaSPA"* ]]; then rename "s/$iwaSPA//g" "$i"; fi 
    ## If the file contains the adjusted indicies then remove 'String'
    if [[ "$i" == *"$iwaVAR"* ]]; then rename "s/$iwaVAR//g" "$i"; fi 
  done

done


##  Loop through the array adjusting each indices through concatenation, removing the indicies entirely
for ida in ${iDotArray[@]}; do
  idaDOT=".$ida."
  idaVAR="$ida"
  # For every file
  for i in *;do
    ## If the file contains the adjusted indicies then remove '.String'
    if [[ "$i" == *"$idaDOT"* ]]; then rename "s/$idaDOT//g" "$i"; fi
    ## If the file contains the adjusted indicies then remove 'String'
    if [[ "$i" == *"$idaVAR"* ]]; then rename "s/$idaVAR//g" "$i"; fi    
  done

done

##  Loop through the array adjusting each indices through concatenation, removing the indicies entirely
for ioa in ${iOmitArray[@]}; do
  ioaVAR="$ioa"
  # For every file
  for i in *;do
    ## If the file contains the adjusted indicies then remove 'String'
    if [[ "$i" == *"$ioaVAR"* ]]; then rename "s/$ioaVAR//g" "$i"; fi    
  done

done



#   Remove Special Characters '$!,@?|&
source <(curl -L https://gist.githubusercontent.com/Chromulent/b1970a6360977c42059824dcfe9457a0/raw/136098e02b8989a6affaab2e683e75fadb2444f0/SpecialCharacters_Filename_Cleanup.sh)

#	Remove floating letters after the apostrophe has been removed
source <(curl -L https://gist.githubusercontent.com/Chromulent/298d4c35a69cf9ad647f92f45fb100eb/raw/653796f609af557330c765d912b684199016332c/FloatingLetters_Filename_Cleanup.sh)

#	Remove artifacting near extensions
source <(curl -L https://gist.githubusercontent.com/Chromulent/0dffd3493abea10e4b629ded8f7d0016/raw/f17b77628637f41b4c1f146a6b506dff6cae3b25/Artifacts_Filename_Cleanup.sh)

#	Replace Periods with Underscores
DOT_Space

#   Replace Underscores with spaces
RUS_command 

#	Replace Triple spaces with a single one
triple_RUS

#	Replace Double spaces with a single one
double_RUS

##	Set Permissions of all files
chmod -R 777 .

