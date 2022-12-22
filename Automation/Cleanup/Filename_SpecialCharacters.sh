#!/bin/sh

# Remove apostrophes from all file names
find . -mindepth 1 -name "*'*" -type f -exec rename "s/'//g" '{}' \;

# Remove dollar signs from all file names
find . -mindepth 1 -name "*$*" -type f -exec rename "s/$//g" '{}' \;

# Remove exclaimation marks from all file names
find . -mindepth 1 -name "*!*" -type f -exec rename "s/\!//g" '{}' \;

# Remove commas from all file names
find . -mindepth 1 -name "*,*" -type f -exec rename "s/,//g" '{}' \;

# Remove question marks from all file names
find . -mindepth 1 -name "*?*" -type f -exec rename "s/\?//g" '{}' \;

# Remove ampersands from all file names
find . -mindepth 1 -name "*&*" -type f -exec rename "s/\&/and/g" '{}' \;

# Remove at signs from all file names
find . -mindepth 1 -name "*@*" -type f -exec rename "s/\@//g" '{}' \;

# Remove vertical bars from all file names
find . -mindepth 1 -name "*|*" -type f -exec rename "s/\|//g" '{}' \;

# Remove Bullet from all file names
find . -mindepth 1 -name "*•*" -type f -exec rename "s/•//g" '{}' \;

# Remove semicolons from all file names
find . -mindepth 1 -name "*;*" -type f -exec rename "s/\;//g" '{}' \;

# Remove colons from all file names
find . -mindepth 1 -name "*:*" -type f -exec rename "s/://g" '{}' \;




# Remove  from all file names
# find . -mindepth 1 -name "**" -type f -exec rename "s/\ //g" '{}' \;