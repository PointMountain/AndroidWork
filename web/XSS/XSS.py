# encoding=utf-8
import requests
import urlparse
import time
import re
import json
from xsspayload import  xsspayload
from bs4 import BeautifulSoup
from sqlDB import SQLConnect
def xss(url):
    if '?' in url:
        domain = url.split('?')[0]
        _url = url.split('?')[-1]
        pararm = {}
        for val in _url.split("&"):
            pararm[val.split("=")[0]] = val.split("=")[-1]
        urls = []
        for val in pararm.values():
            new_url = domain + _url.replace(val, "Payload")
            urls.append(new_url)
        for payload in xsspayload:
            for __url in urls:
                try:
                    content = requests.get(__url.replace('Payload', payload)).content
                    if content.find(payload) and requests.get(__url.replace('Payload', payload)).status_code == 202:
                        return json.dumps(dict(status="1",url=__url))
                except Exception, e:
                    pass
        return json.dumps(dict(status="0", dec="can not find xss"))
    else:
        for payload in xsspayload:
            url=url+'/'+payload
            try:
                content = requests.get(url).content
                if content.find(payload) and requests.get(url).status_code==200:
                    #print 'chenggong'
                    SQLConnect.insertsx('xss',url)
                    return json.dumps(dict(status="1", url=url))
            except Exception, e:
                pass
        return json.dumps(dict(status="0", dec="can not find xss"))