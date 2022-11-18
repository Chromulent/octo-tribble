#!/usr/bin/env python3

import requests
import re

channel = "https://www.youtube.com/channel/UCUMQFUkgaEE68_ujIdW2wAw"

html = requests.get(channel + "/videos").text
url = "https://www.youtube.com/watch?v=" + re.search('(?<="videoId":").*?(?=")', html).group()


ytvid = print(url) 

