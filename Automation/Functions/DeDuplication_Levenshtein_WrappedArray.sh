#!/bin/sh

namebased_deduplication () {
    # Store all files in this directory into an array
    files=(*)
    delarr=()
    # duplicate the existing array for manipulation of elements
    subarry=("${files[@]}") 
    # using the increment value of i, iterate against the total number of items indexed in the array
    for i in "${!files[@]}"; do
        # using the increment value and the duplicate array, create dynamic variable of element at the index location
        searv="$(echo "${subarry[$i]}")"
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
                echo "Adding file to deletion array: $value"
                delarr+=("$value")
                break
             fi
       done
    done

    len=${#delarr[@]}
    for (( u=0; u<$len; u++ )); do 
        clear
        echo "${delarr[$u]}" ; 
        echo "Do you wish to delete this file: ${delarr[$u]}"
        select yn in "Yes" "No"; do
            case $yn in
                Yes ) rm -rf "${delarr[$u]}" ; echo "deleting... ${delarr[$u]}"; break;;
                No )  echo "no" ; break;;
            esac
        done
    done
}

# Suggestions for defined variable be higher than 83%.
# Recomendation for defined variable be set to 89%.
# A lower percentage yeilds more results, which will forcefully delete content.

# Be sure to uncomment the remove command after confirming test results for deletion to occur.

# If content has similar naming schemes, consider checking the average percentage with up to five files using levenshtein utility fstrcmp
# Comp1=""
# Comp2=""
# fstrcmp "$Comp1" "$Comp2"

