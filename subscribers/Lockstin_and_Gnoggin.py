#!/usr/bin/env python3

import requests
import re

channel = "https://www.youtube.com/channel/UC6sjkvDzyY0J8o7k2Kc5rEw"

html = requests.get(channel + "/videos").text
url = "https://www.youtube.com/watch?v=" + re.search('(?<="videoId":").*?(?=")', html)


ytvid = print(url) 

