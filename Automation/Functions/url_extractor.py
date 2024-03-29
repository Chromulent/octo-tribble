#!/bin/python3

# from https://pastebin.com/raw/dJ6W8nZ6
# Created by /u/drs_ilex
# Thread : https://www.reddit.com/r/opendirectories/comments/118g08d/link_scrapper_python_script/

# Utilization for Linux
# ./url_extractor.py http://5.135.178.104:10987 .mkv Lock
# ./url_extractor.py (OpenDir) (Extension) (Text we are searching for)

# Utilization for for Windows
# python3 url_extractor.py http://5.135.178.104:10987 .mkv Lock
# python3 url_extractor.py (OpenDir) (Extension) (Text we are searching for)


import requests
import sys
args = sys.argv[1:]
size = len(args)
if size==0:
        url = str(input("url : "))
        extensionYoureLookingFor = str(input("extension you're looking for : "))
        textYoureLookingFor = str(input("text you're looking for : "))
elif size>=2 and size<4:
        url = args[0]
        extensionYoureLookingFor = args[1]
        textYoureLookingFor = args[2] if size>2 else ""
else:
        print("usage : ./url_extractor.py <url> <extension you're looking for> [text you're looking for]")
r = requests.get(url)
def inBetween(string, open_b, closed_b):
        idx_begin = string.find(open_b) + len(open_b)
        idx_end = string.find(closed_b)
        return string[idx_begin:idx_end]
for i in r.text.split("\n"):
        if textYoureLookingFor in i and extensionYoureLookingFor in i:
                probablyALink = inBetween(i,"href=\"",extensionYoureLookingFor)
                print(url+probablyALink+extensionYoureLookingFor)