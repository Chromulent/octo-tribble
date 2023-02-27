#!/usr/bin/env python3

import requests
import re

channel = "https://www.youtube.com/channel/UC7FkqjV8SU5I8FCHXQSQe9Q"

html = requests.get(channel + "/videos").text
url = "https://www.youtube.com/watch?v=" + re.search('(?<="videoId":").*?(?=")', html)


ytvid = print(url) 

