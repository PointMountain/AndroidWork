# encoding=utf-8
import requests
print requests.post(url='http://112.74.204.232:81/scrackmysql',data={"ip":"112.74.204.232"}).content
data={
    'url':'http://222.206.181.203/bhdsweb/zhbwdgsnry.asp?gsid=5&cpfbfs=1'
}
data1={
    'url':'http://127.0.0.1:5000'
}
#print requests.post(url='http://127.0.0.1:8080/sqlmap',data=data).content
#print requests.post(url='http://127.0.0.1:8080/xss',data=data1).content
#print requests.post(url="http://127.0.0.1:8080/login",data={"uesr":'hlpureboy',"pwd":"123pyj.com"}).content
#print requests.post(url="http://112.74.204.232:81/mysql",data={"ip":"112.74.204.232"})
print requests.post(url='http://112.74.204.232:81/scrackmysql',data={"ip":"112.74.204.233"}).content