
# Cache the Array that is going to be running the commands
source <(curl -L https://gist.githubusercontent.com/Chromulent/3ade29dcaf512f57c79124ea23a27d8b/raw/f177882a9068564125ec0168546b15801bc29e3b/Twenty3_Array.sh)

##  Loop through the array adjusting each indices through concatenation and prefixing the indicies with common delimiters
for film in ${wgetarr[@]}; do
  wget $film
  sleep 900
done


# Store some variables to ensure they get removed to ensure that duplication of files does not occur.
suuPar="%20"
prePar="%28"
subPar="%29"
space=" "
newprePar="("
newsubPar=")"
Namecheck = "$film"

##  Loop through the array adjusting each indices through concatenation and prefixing the indicies with common delimiters
for film in ${wgetarr[@]}; do
  #echo $film
  Namecheck1="$film"
  Namecheck2=${Namecheck1//pattern/string}
  Namecheck3 =${Namecheck2//suuPar/space}
  Namecheck4 =${Namecheck3//prePar/newprePar}
  Namecheck=${Namecheck4//subPar/newsubPar}
  echo $Namecheck
  echo $film
  

done



'Balls of Fury (2007).mkv'
Balls%20of%20Fury%20%282007%29.mkv



%20

## Replace Single
#!/bin/bash
firstString="I love Suzi and Marry"
secondString="Sara"
echo "${firstString/Suzi/"$secondString"}"    
# prints 'I love Sara and Marry'

## Replace All Occurrances
${parameter//pattern/string}

