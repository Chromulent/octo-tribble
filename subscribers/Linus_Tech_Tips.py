#!/usr/bin/env python3

import requests
import re

channel = "https://www.youtube.com/channel/UCXuqSBlHAE6Xw-yeJA0Tunw"

html = requests.get(channel + "/videos").text
url = "https://www.youtube.com/watch?v=" + re.search('(?<="videoId":").*?(?=")', html)


ytvid = print(url) 

