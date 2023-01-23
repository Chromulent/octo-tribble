#!/bin/sh



coreVid="/mnt/OpenDrive/Videos/Film/*"
MausVid="/mnt/Mausoleum/sets/film/*"
setsVid="/mnt/OpenDrive/Videos/temp/sets/film/*"

subarrCoreVid=("${coreVid[@]}") 
subarrMausVid=("${MausVid[@]}") 
subarrsetsVid=("${setsVid[@]}") 





for i in "${!coreVid[@]}"; do
        # using the increment value and the duplicate array, create dynamic variable of element at the index location
        searv="$(echo "${subarrCoreVid[$i]}")"
        # remove this value from the duplicate array at the index number that the increment value was last defined as
        unset 'subarry[$i]' 
        # using the increment value of n, iterate against the total number of items index in the duplicate array
        for n in "${!subarry[@]}"; do
            # store the element content based on the increasing value of increment n
            value="$(echo "${subarry[$n]}")"
            # Compare file likeness using levenshtein method, and store this value as variable
            pu="$(fstrcmp "$searv" "$value" )"
            # Remove 0 from variable method
            put="$(echo ${pu:1:3})"
            # IF decimal value is greater than then percentage given then delete
            if [[ "$put" > "${x}" ]]; then
                echo "Deleting file based off named based duplication : $value"
                rm -rf "$value"
                break
             fi
       done
    done






























