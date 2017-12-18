# encoding=utf-8
from Scrack import Scrack
from SelfInfo import SelfInfo
from Sqlmap import sql
from XSS import XSS
from sqlDB import SQLConnect
import web
urls=(
    '/scrackftp','ftp',
    '/scrackmssql','mssql',
    '/scrackmysql','mysql',
    '/scrackssh','ssh',
    '/sqlmap','sqlmap',
    '/xss','xss',
    '/login','login',
    '/(.*)','index'
)
temp=web.template.render('temp')
app=web.application(urls, globals())
class login:
    def POST(self):
        n=web.input()
        user=n.get('uesr')
        pwd=n.get('pwd')
        return SQLConnect.login(user,pwd)
class ftp:
    def POST(self):
        n=web.input()
        ip=n.get('ip')
        return Scrack.ftp(ip)
    def GET(self,ip):
        return Scrack.ftp(ip)
class mssql:
    def GET(self,ip):
        return Scrack.mssql(ip)
    def POST(self):
        n = web.input()
        ip = n.get('ip')
        return Scrack.mssql(ip)
class mysql:
    def GET(self,ip):
        return Scrack.mysql(ip)
    def POST(self):
        n = web.input()
        ip = n.get('ip')
        return Scrack.mysql(ip)
class ssh:
    def GET(self,ip):
        return Scrack.ssh(ip)
    def POST(self):
        n = web.input()
        ip = n.get('ip')
        return Scrack.ssh(ip)
class sqlmap:
    def GET(self,url):
        return sql.sql(url)
    def POST(self):
        n=web.input()
        url=n.get('url')
        return sql.sql(url)
class xss:
    def GET(self,url):
        return XSS.xss(url)
    def POST(self):
        n = web.input()
        url = n.get('url')
        return XSS.xss(url)
class index:
    def GET(self,name):
        return temp.index()
if __name__ == '__main__':
    app.run()