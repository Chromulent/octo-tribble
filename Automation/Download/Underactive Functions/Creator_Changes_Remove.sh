declare -a arr=(" -   The Story of Fallout 1 "
    " - Fallout 1 Lore"
    " - Fallout 1 Lore"
    " - Fallout 1"
    " - Fallout 3 Lore"
    " - Fallout 3"
    " - Fallout Lore"
    " - Fallout New Vegas Lore"
    " - Fallout New Vegas"
    " - Fallout"
    " Fallout 3 Lore"
    " Fallout Lore"
    " Fallout New Vegas Lore"
    "-Fallout 2 Lore"
    "-Fallout 3 Lore"
    "-The Story of Fallout 2 "
    "F2 "
    "F3 "
    "The Full Story of Fallout 1 "
    "The Full Story of Fallout New Vegas "
    "The Story of Fallout 1 "
    "The Story of Fallout New Vegas "
    "   with John Oliver-HBO-"
    "Defunctland - "
    "Defunctland_ "
    "DefunctTV - "
    "    with John Oliver (HBO) "
    "   with John Oliver-Web Exclusive-"
    "   with John Oliver (HBO) "
    "  with John Oliver-"
    "    with John Oliver "
    " with John Oliver (HBO)"
    " with John Oliver"
	" Last Week Tonight  "
	"Last Week Tonight With John Oliver"
	" - Last Week Tonight with John Oliver HBO"
  "HBO"
	
                )

# Store the empty variable for renaming files here
m=" "

#	Replace all above variables if found with a space.
for v in "${arr[@]}"
do
  for i in *;do
    if 
    [[ "$i" == *"${v}"* ]];then
	rename "s/$v/$m/g" "$i"
    fi
  done
done
