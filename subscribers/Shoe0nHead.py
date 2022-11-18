#!/usr/bin/env python3

import requests
import re

channel = "https://www.youtube.com/channel/UC0aanx5rpr7D1M7KCFYzrLQ"

html = requests.get(channel + "/videos").text
url = "https://www.youtube.com/watch?v=" + re.search('(?<="videoId":").*?(?=")', html).group()


ytvid = print(url) 

