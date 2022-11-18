#!/usr/bin/env python3

import requests
import re

channel = "https://www.youtube.com/channel/UCxt9Pvye-9x_AIcb1UtmF1Q"

html = requests.get(channel + "/videos").text
url = "https://www.youtube.com/watch?v=" + re.search('(?<="videoId":").*?(?=")', html).group()


ytvid = print(url) 

