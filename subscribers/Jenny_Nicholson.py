#!/usr/bin/env python3

import requests
import re

channel = "https://www.youtube.com/channel/UC7-E5xhZBZdW-8d7V80mzfg"

html = requests.get(channel + "/videos").text
url = "https://www.youtube.com/watch?v=" + re.search('(?<="videoId":").*?(?=")', html).group()


ytvid = print(url) 

