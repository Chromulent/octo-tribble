#!/usr/bin/env python3

import requests
import re

channel = "https://www.youtube.com/channel/UCo1pShh6dtg-T_ZZkgi_JDQ"

html = requests.get(channel + "/videos").text
url = "https://www.youtube.com/watch?v=" + re.search('(?<="videoId":").*?(?=")', html).group()


ytvid = print(url) 

