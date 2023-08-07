#!/bin/sh

##  Script file where we download videos
#   Alter the script to remove past content
sed -i d "$contentFile"

#   Add the shell utility to tell the script what to use when running the script.
sed '1 i #!/bin/sh' "$contentFile"
echo '#!/bin/sh' > "$contentFile"

#   Here we add an empty line in order to break commands away from the interperter from the rest of the script.
echo -en '\n' >> "$contentFile"


