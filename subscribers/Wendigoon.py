#!/usr/bin/env python3

import requests
import re

channel = "https://www.youtube.com/channel/UC3cpN6gcJQqcCM6mxRUo_dA"

html = requests.get(channel + "/videos").text
url = "https://www.youtube.com/watch?v=" + re.search('(?<="videoId":").*?(?=")', html).group()


ytvid = print(url) 

