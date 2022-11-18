#!/usr/bin/env python3

import requests
import re

channel = "https://www.youtube.com/channel/UC4JL8XJ9dxqfvzTM8L5Sl3w"

html = requests.get(channel + "/videos").text
url = "https://www.youtube.com/watch?v=" + re.search('(?<="videoId":").*?(?=")', html).group()


ytvid = print(url) 

