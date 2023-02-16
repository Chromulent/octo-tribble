#!/bin/sh

cd '/mnt/OpenDrive/Videos/Creators'

# Cache Function script - String Replacement
source <(curl -L https://gist.githubusercontent.com/Chromulent/f8750e6063eb83e8630dadaaac35d64e/raw/1e0311c270939a77d6912a997bbd034a566b7207/Fn_String_Replacement.sh)

# Cache Function script - Replace Underscore with Space
source <(curl -L https://gist.githubusercontent.com/Chromulent/8ce9f4080e098b76bff807f501770fc5/raw/e35e2fc2492e87850de95d9ad530b4cbfaf41c5a/Fn_Remove_Underscore.sh)
RUS_command

# Remote Execution - Remove special characters from file names
source <(curl -L https://gist.githubusercontent.com/Chromulent/b1970a6360977c42059824dcfe9457a0/raw/136098e02b8989a6affaab2e683e75fadb2444f0/SpecialCharacters_Filename_Cleanup.sh)

# Remote Execution - Remove directory name from file names
source <(curl -L https://gist.githubusercontent.com/Chromulent/dbe09470e94dd06335cd1045e0ee8725/raw/8f4bab7363ec7548a6acdf06cc56817f89990d2b/Fn_Remove_Directory_inFilename.sh)
Directory_FileName_Purge

# Remote Execution - Remove floating letters
source <(curl -L https://gist.githubusercontent.com/Chromulent/298d4c35a69cf9ad647f92f45fb100eb/raw/653796f609af557330c765d912b684199016332c/FloatingLetters_Filename_Cleanup.sh)

#   Remote Execution - Creator Changes Remove
##  Remove incredibly specific content for specific Creators that do not use standard naming conventions
source <(curl -L https://gist.githubusercontent.com/Chromulent/ebc2da070782c01bccbf61798db7d76a/raw/a93bfb2b8d063d321cd00156e0dfa2d3b69ca7ac/Creator_Changes_Remove.sh)

#   Remote Execution - Creator Changes Rename
##  Ensure that content that can be standardized is, by specific Creators that do not have a strict standard for naming conventions
source <(curl -L https://gist.githubusercontent.com/Chromulent/87cd63b320f6f9b5297128adcad65c5d/raw/d19ebfddd2db18b13e7946eee76d6a4b6c808f36/Creator_Changes_Rename.sh)

# Remote Execution - Remove White Space (Leading and Trailing
source <(curl -L https://gist.githubusercontent.com/Chromulent/191207a117a0919e4a10e63aa6ddb009/raw/ab54d0b2090f0f668f181beaa54c1890539abfd6/Remove_WhiteSpace.sh)

# Remote Execution - Set Permissions to 777 to all files and go up one directory
source <(curl -L https://gist.githubusercontent.com/Chromulent/677b166fc406bf172602349d877cf2d0/raw/68875afafc3078699af1cab838cb92361e42b837/Directory_Permissions_Set.sh)

cd '/mnt/OpenDrive/Videos/YouTube'

# Remote Execution - Remove special characters from file names
source <(curl -L https://gist.githubusercontent.com/Chromulent/b1970a6360977c42059824dcfe9457a0/raw/136098e02b8989a6affaab2e683e75fadb2444f0/SpecialCharacters_Filename_Cleanup.sh)

# Remote Execution - Remove directory name from file names
source <(curl -L https://gist.githubusercontent.com/Chromulent/dbe09470e94dd06335cd1045e0ee8725/raw/8f4bab7363ec7548a6acdf06cc56817f89990d2b/Fn_Remove_Directory_inFilename.sh)

# Remote Execution - Remove floating letters
source <(curl -L https://gist.githubusercontent.com/Chromulent/298d4c35a69cf9ad647f92f45fb100eb/raw/653796f609af557330c765d912b684199016332c/FloatingLetters_Filename_Cleanup.sh)

#   Remote Execution - Creator Changes Remove
##  Remove incredibly specific content for specific Creators that do not use standard naming conventions
source <(curl -L https://gist.githubusercontent.com/Chromulent/ebc2da070782c01bccbf61798db7d76a/raw/a93bfb2b8d063d321cd00156e0dfa2d3b69ca7ac/Creator_Changes_Remove.sh)

#   Remote Execution - Creator Changes Rename
##  Ensure that content that can be standardized is, by specific Creators that do not have a strict standard for naming conventions
source <(curl -L https://gist.githubusercontent.com/Chromulent/87cd63b320f6f9b5297128adcad65c5d/raw/d19ebfddd2db18b13e7946eee76d6a4b6c808f36/Creator_Changes_Rename.sh)

# Remote Execution - Remove White Space (Leading and Trailing
source <(curl -L https://gist.githubusercontent.com/Chromulent/191207a117a0919e4a10e63aa6ddb009/raw/ab54d0b2090f0f668f181beaa54c1890539abfd6/Remove_WhiteSpace.sh)

# Remote Execution - Set Permissions to 777 to all files and go up one directory
source <(curl -L https://gist.githubusercontent.com/Chromulent/677b166fc406bf172602349d877cf2d0/raw/68875afafc3078699af1cab838cb92361e42b837/Directory_Permissions_Set.sh)

## Templates
# Remote Execution - 
# source <(curl -L )


exit