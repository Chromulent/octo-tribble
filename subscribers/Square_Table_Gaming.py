#!/usr/bin/env python3

import requests
import re

channel = "https://www.youtube.com/channel/UCB07XDRsWAb4u3mJwk6OoRQ"

html = requests.get(channel + "/videos").text
url = "https://www.youtube.com/watch?v=" + re.search('(?<="videoId":").*?(?=")', html)


ytvid = print(url) 

