#!/usr/bin/env python3

import requests
import re

channel = "https://www.youtube.com/channel/UCL8w_A8p8P1HWI3k6PR5Z6w"

html = requests.get(channel + "/videos").text
url = "https://www.youtube.com/watch?v=" + re.search('(?<="videoId":").*?(?=")', html).group()


ytvid = print(url) 

