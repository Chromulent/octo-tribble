#   Write Function that we will use to write content to the contentfile to download videos.
Case_Function () {
#  Case allows us to to create a default set of variables so that in the next section we can run through any possible creator that we have on this list.
    case "$ChannelName" in 
    "All Gas No Brakes") subdirout='/mnt/OpenDrive3/Videos/Creators/All Gas No Brakes/%(title)s.%(ext)s' ; exFilter="" ;;
    "ashens") subdirout='/mnt/OpenDrive3/Videos/Creators/Ashens/%(title)s.%(ext)s' ; exFilter="" ;;
    "Babish Culinary Universe") subdirout='/mnt/OpenDrive3/Videos/Creators/Binging with Babish/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Billiam") subdirout='/mnt/OpenDrive3/Videos/Creators/Billiam/%(title)s.%(ext)s'  ; exFilter="" ;;
    "BosnianBill") subdirout='/mnt/OpenDrive3/Videos/Creators/BosnianBill/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Brandon Sanderson") subdirout='/mnt/OpenDrive3/Videos/Creators/Brandon Sanderson/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Captain Disillusion") subdirout='/mnt/OpenDrive3/Videos/Creators/Captain Disillusion/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Caroline Konstnar") subdirout='/mnt/OpenDrive3/Videos/Creators/Caroline Konstnar/%(title)s.%(ext)s'  ; exFilter="" ;;
    "CGP Grey") subdirout='/mnt/OpenDrive3/Videos/Creators/CGP Grey/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Chad Chad") subdirout='/mnt/OpenDrive3/Videos/Creators/Chad Chad/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Channel 5 with Andrew Callaghan") subdirout='/mnt/OpenDrive3/Videos/Creators/All Gas No Brakes/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Clickspring") subdirout='/mnt/OpenDrive3/Videos/Creators/Clickspring/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Comedy Cheat Codes") subdirout='/mnt/OpenDrive3/Videos/Creators/Comedy Cheat Codes/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Court of Source") subdirout='/mnt/OpenDrive3/Videos/Creators/Court of Source/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Dan Bull") subdirout='/mnt/OpenDrive3/Videos/Creators/Dan Bull/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Defunctland") subdirout='/mnt/OpenDrive3/Videos/Creators/Defunctland/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Dime Store Adventures") subdirout='/mnt/OpenDrive3/Videos/Creators/Dime Store Adventures/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Extra History") subdirout='/mnt/OpenDrive3/Videos/Creators/Extra History/%(title)s.%(ext)s' ; exFilter_prefix=' --match-filter "title ~= (?i)"' ; filterVarible="LIES" ; exFilter_suffix='" ' ; exFilter="${exFilter_prefix}${filterVarible}${exFilter_suffix}" ;;
    "Fredrik Knudsen") subdirout='/mnt/OpenDrive3/Videos/Creators/Fredrik Knudsen/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Gabi Belle") subdirout='/mnt/OpenDrive3/Videos/Creators/Gabi Belle/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Historia Civilis") subdirout='/mnt/OpenDrive3/Videos/Creators/Historia Civilis/%(title)s.%(ext)s'  ; exFilter="" ;;
    "History Buffs") subdirout='/mnt/OpenDrive3/Videos/Creators/History Buffs/%(title)s.%(ext)s'  ; exFilter="" ;;
    #"iilluminaughtii") subdirout='/mnt/OpenDrive3/Videos/Creators/iilluminaughtii/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Invicta") subdirout='/mnt/OpenDrive3/Videos/Creators/Invicta/%(title)s.%(ext)s'  ; exFilter="" ;;
    "ISHITANI FURNITURE") subdirout='/mnt/OpenDrive3/Videos/Creators/ISHITANI FURNITURE/%(title)s.%(ext)s'  ;;
    "J C S") subdirout='/mnt/OpenDrive3/Videos/Creators/JCS Criminal Psychology/%(title)s.%(ext)s'  ; exFilter="" ;;
    "JCS - Criminal Psychology") subdirout='/mnt/OpenDrive3/Videos/Creators/JCS Criminal Psychology/%(title)s.%(ext)s'  ; exFilter="" ;;
    "j aubrey") subdirout='/mnt/OpenDrive3/Videos/Creators/JAubrey/%(title)s.%(ext)s'   ; exFilter="" ;;
    "Jaboody Dubs") subdirout='/mnt/OpenDrive3/Videos/Creators/Jaboody Dubs/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Jacob Sharpe") subdirout='/mnt/OpenDrive3/Videos/Creators/Jacob Sharpe/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Jaiden Animatations") subdirout='/mnt/OpenDrive3/Videos/Creators/Jaiden Animatations/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Jenny Nicholson") subdirout='/mnt/OpenDrive3/Videos/Creators/Jenny Nicholson/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Jim Browning") subdirout='/mnt/OpenDrive3/Videos/Creators/Jim Browning/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Jim Sterling") subdirout='/mnt/OpenDrive3/Videos/Creators/Jim Sterling/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Johnny Harris") subdirout='/mnt/OpenDrive3/Videos/Creators/Johnny Harris/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Josh Strife Hayes") subdirout='/mnt/OpenDrive3/Videos/Creators/Josh Strife Hayes/%(title)s.%(ext)s' ; exFilter_prefix=' --match-filter "' ; filterVarible='!is_live & !live' ; exFilter_suffix='" ' ; exFilter="${exFilter_prefix}${filterVarible}${exFilter_suffix}" ;;
    "Karl Jobst") subdirout='/mnt/OpenDrive3/Videos/Creators/Karl Jobst/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Kilian Experience") subdirout='/mnt/OpenDrive3/Videos/Creators/Kilian Experience/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Kings and Generals") subdirout='/mnt/OpenDrive3/Videos/Creators/Kings and Generals/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Kitboga") subdirout='/mnt/OpenDrive3/Videos/Creators/Kitboga/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Kurtis Conner") subdirout='/mnt/OpenDrive3/Videos/Creators/Kurtis Conner/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Kurzgesagt – In a Nutshell") subdirout='/mnt/OpenDrive3/Videos/Creators/Kurzgesagt/%(title)s.%(ext)s'  ; exFilter="" ;;
    "LastWeekTonight") subdirout='/mnt/OpenDrive3/Videos/Creators/Last Week Tonight/%(title)s.%(ext)s'  ; exFilter="" ;;
    "LegalEagle") subdirout='/mnt/OpenDrive3/Videos/Creators/Legal Eagle/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Linus Tech Tips") subdirout='/mnt/OpenDrive3/Videos/Creators/Linus Tech Tips/%(title)s.%(ext)s'  ; exFilter="" ;;
    "LockPickingLawyer") subdirout='/mnt/OpenDrive3/Videos/Creators/LockPickingLawyer/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Lockstin and Gnoggin") subdirout='/mnt/OpenDrive3/Videos/Creators/Lockstin and Gnoggin/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Münecat") subdirout='/mnt/OpenDrive3/Videos/Creators/Munecat/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Naomi Brockwell: NBTV") subdirout='/mnt/OpenDrive3/Videos/Creators/Naomi Brockwell: NBTV/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Nerdwriter1") subdirout='/mnt/OpenDrive3/Videos/Creators/Nerdwriter1/%(title)s.%(ext)s'  ; exFilter="" ;;
    "OfficialNerdCubed") subdirout='/mnt/OpenDrive3/Videos/Creators/OfficialNerdCubed/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Oxhorn") subdirout='/mnt/OpenDrive3/Videos/Creators/Oxhorn/%(title)s.%(ext)s' ; exFilter=' --match-filter "title ~= (?i)Fallout" --match-filter "description!~='#fallout'" --match-filter "description!~='#Fallout'" ';;
    "Primitive Technology") subdirout='/mnt/OpenDrive3/Videos/Creators/Primitive Technology/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Puffin Forest") subdirout='/mnt/OpenDrive3/Videos/Creators/Puffin Forest/%(title)s.%(ext)s'  ; exFilter="" ;;
    "psychotrip") subdirout='/mnt/OpenDrive3/Videos/Creators/psychotrip/%(title)s.%(ext)s'  ;;
    "RamZaes") subdirout='/mnt/OpenDrive3/Videos/Creators/RamZaes/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Random Game Reviews") subdirout='/mnt/OpenDrive3/Videos/Creators/Random Game Reviews/%(title)s.%(ext)s'  ; exFilter="" ;;
    "RealLifeLore") subdirout='/mnt/OpenDrive3/Videos/Creators/RealLifeLore/%(title)s.%(ext)s'  ; exFilter="" ;;
    "RedLetterMedia") subdirout='/mnt/OpenDrive3/Videos/Creators/RedLetterMedia/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Regular Car Reviews") subdirout='/mnt/OpenDrive3/Videos/Creators/Regular Car Reviews/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Runesmith") subdirout='/mnt/OpenDrive3/Videos/Creators/RuneSmith/%(title)s.%(ext)s'  ; exFilter="" ;;
    "ShaneBrained") subdirout='/mnt/OpenDrive3/Videos/Creators/ShaneBrained/%(title)s.%(ext)s'  ; exFilter="" ;;
    "ShoddyCast") subdirout='/mnt/OpenDrive3/Videos/Creators/ShoddyCast/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Shoe0nHead") subdirout='/mnt/OpenDrive3/Videos/Creators/Shoe0nHead/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Square Table Gaming") subdirout='/mnt/OpenDrive3/Videos/Creators/Square Table Gaming/%(title)s.%(ext)s' ; exFilter_prefix=' --match-filter "title ~= (?i)"' ; filterVarible="Elden" ; exFilter_suffix='" ' ; exFilter="${exFilter_prefix}${filterVarible}${exFilter_suffix}" ;;
    "Storied") subdirout='/mnt/OpenDrive3/Videos/Creators/Storied/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Tales of Alethrion") subdirout='/mnt/OpenDrive3/Videos/Creators/Tales of Alethrion/%(title)s.%(ext)s'  ; exFilter="" ;;
    "The Tarnished Archaeologist") subdirout='/mnt/OpenDrive3/Videos/Creators/The Tarnished Archaeologist/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Technology Connections") subdirout='/mnt/OpenDrive3/Videos/Creators/Technology Connections/%(title)s.%(ext)s'  ; exFilter="" ;;
    "thebrainscoop") subdirout='/mnt/OpenDrive3/Videos/Creators/thebrainscoop/%(title)s.%(ext)s'  ; exFilter=""  ;;
    "The Cosmonaut Variety Hour") subdirout='/mnt/OpenDrive3/Videos/Creators/The Cosmonaut Variety Hour/%(title)s.%(ext)s'  ; exFilter="" ;;
    "The Game Theorists") subdirout='/mnt/OpenDrive3/Videos/Creators/The Game Theorists/%(title)s.%(ext)s'  ; exFilter="" ;;
    "This is Dan Bell.") subdirout='/mnt/OpenDrive3/Videos/Creators/This is Dan Bell/%(title)s.%(ext)s' ; exFilter_prefix=' --match-filter "title ~= (?i)"' ; filterVarible="Another Dirty Room" ; exFilter_suffix='" ' ; exFilter="${exFilter_prefix}${filterVarible}${exFilter_suffix}" ;;
    "Thomas Frank") subdirout='/mnt/OpenDrive3/Videos/Creators/Thomas Frank/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Toatapio Nuva") subdirout='/mnt/OpenDrive3/Videos/Creators/Toatapio Nuva/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Trekspertise") subdirout='/mnt/OpenDrive3/Videos/Creators/Trekspertise/%(title)s.%(ext)s'  ; exFilter="" ;;
    "TrixyBlox") subdirout='/mnt/OpenDrive3/Videos/Creators/TrixyBlox/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Two Cents") subdirout='/mnt/OpenDrive3/Videos/Creators/Two Cents/%(title)s.%(ext)s'  ; exFilter="" ;;
    "VaatiVidya") subdirout='/mnt/OpenDrive3/Videos/Creators/VaatiVidya/%(title)s.%(ext)s' ; exFilter_prefix=' --match-filter "title ~= (?i)"' ; filterVarible="Elden" ; exFilter_suffix='" ' ; exFilter="${exFilter_prefix}${filterVarible}${exFilter_suffix}" ;;
    "Viakavish") subdirout='/mnt/OpenDrive3/Videos/Creators/Viakavish/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Watcher") subdirout='/mnt/OpenDrive3/Videos/Creators/Watcher/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Wendigoon") subdirout='/mnt/OpenDrive3/Videos/Creators/Wendigoon/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Wendover Productions") subdirout='/mnt/OpenDrive3/Videos/Creators/Wendover Productions/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Worldbuilding Notes") subdirout='/mnt/OpenDrive3/Videos/Creators/Worldbuilding Notes/%(title)s.%(ext)s'  ; exFilter="" ;;
    "YOGSCAST Lewis and Simon") subdirout='/mnt/OpenDrive3/Videos/Creators/YOGSCAST Lewis and Simon/%(title)s.%(ext)s' ; exFilter_prefix=' --match-filter "title ~= (?i)"' ; filterVarible="Minecraft" ; exFilter_suffix='" ' ; exFilter="${exFilter_prefix}${filterVarible}${exFilter_suffix}" ;;
    "Ze Frank") subdirout='/mnt/OpenDrive3/Videos/Creators/zefrank/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Zee Bashew") subdirout='/mnt/OpenDrive3/Videos/Creators/Zee Bashew/%(title)s.%(ext)s'  ; exFilter="" ;;
    "Zullie the Witch") subdirout='/mnt/OpenDrive3/Videos/Creators/Zulliethe Witch/%(title)s.%(ext)s' ; exFilter_prefix=' --match-filter "title ~= (?i)"' ; filterVarible="Elden" ; exFilter_suffix='" ' ; exFilter="${exFilter_prefix}${filterVarible}${exFilter_suffix}" ;;
    #"") subdirout='/mnt/OpenDrive3/Videos/Creators//%(title)s.%(ext)s' ; exFilter="" ;;
    esac

}


